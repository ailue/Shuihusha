#include "engine.h"
#include "card.h"
#include "client.h"
#include "ai.h"
#include "settings.h"
#include "scenario.h"
#include "lua.hpp"
#include "banpair.h"
#include "audio.h"
#include "protocol.h"
#include "jsonutils.h"
#include "structs.h"

#include <QFile>
#include <QTextStream>
#include <QStringList>
#include <QMessageBox>
#include <QDir>
#include <QApplication>

Engine *Sanguosha = NULL;

void Engine::addPackage(const QString &name){
    Package *pack = PackageAdder::packages()[name];
    if(pack)
        addPackage(pack);
    else
        qWarning("Package %s cannot be loaded!", qPrintable(name));
}

void Engine::addScenario(const QString &name){
    Scenario *scenario = ScenarioAdder::scenarios()[name];
    if(scenario)
        addScenario(scenario);
    else
        qWarning("Scenario %s cannot be loaded!", qPrintable(name));
}

Engine::Engine()
{
    Sanguosha = this;

    lua = CreateLuaState();
    DoLuaScript(lua, "lua/config.lua");

    QStringList package_names = GetConfigFromLuaState(lua, "package_names").toStringList();
    foreach(QString name, package_names)
        addPackage(name);

    QStringList scene_names = GetConfigFromLuaState(lua, "scene_names").toStringList();
    foreach(QString name, scene_names)
        addScenario(name);

    DoLuaScript(lua, "lua/sanguosha.lua");

    // available game modes
    modes["02p"] = tr("2 players");
    modes["02_1v1"] = tr("2 players (KOF style)");
    modes["03p"] = tr("3 players");
    modes["04p"] = tr("4 players");
    modes["05p"] = tr("5 players");
    modes["06p"] = tr("6 players");
    modes["06pd"] = tr("6 players (2 renegades)");
    modes["06_3v3"] = tr("6 players (3v3)");
    modes["07p"] = tr("7 players");
    modes["08p"] = tr("8 players");
    modes["08pd"] = tr("8 players (2 renegades)");
    modes["08pz"] = tr("8 players (0 renegade)");
    modes["09p"] = tr("9 players");
    modes["10pd"] = tr("10 players");
    modes["10p"] = tr("10 players (1 renegade)");
    modes["10pz"] = tr("10 players (0 renegade)");
    //modes["11p"] = tr("11 players");
    modes["12p"] = tr("12 players");

    connect(qApp, SIGNAL(aboutToQuit()), this, SLOT(deleteLater()));

    foreach(QString ban, getBanPackages())
        addBanPackage(ban);

    foreach(const Skill *skill, skills.values()){
        Skill *mutable_skill = const_cast<Skill *>(skill);
        mutable_skill->initMediaSource();
    }
}

lua_State *Engine::getLuaState() const{
    return lua;
}

void Engine::addTranslationEntry(const char *key, const char *value){
    translations.insert(key, QString::fromUtf8(value));
}

Engine::~Engine(){
    lua_close(lua);

#ifdef AUDIO_SUPPORT

    Audio::quit();

#endif
}

QStringList Engine::getScenarioNames() const{
    QStringList names;
    foreach(QString name, scenarios.keys())
        if(!name.contains("_mini_") && !name.contains("custom_scenario")) names << name;
    return names;
}

void Engine::addScenario(Scenario *scenario){
    scenarios.insert(scenario->objectName(), scenario);

    addPackage(scenario);
}

const Scenario *Engine::getScenario(const QString &name) const{
    return scenarios.value(name, NULL);
}

bool Engine::getScenarioLordSkill(const QString &mode) const{
    const Scenario *scenario = getScenario(mode);
    if(!scenario)
        return false;
    return scenario->unloadLordSkill();
}

void Engine::addSkills(const QList<const Skill *> &all_skills){
    foreach(const Skill *skill, all_skills){
        if(skills.contains(skill->objectName())){
            if(!Config.value("MuteLoad", false).toBool())
                QMessageBox::warning(NULL, "", tr("Duplicated skill : %1").arg(skill->objectName()));
            QVariantList duplis = Config.value("Duplicated", QVariant()).toList();
            duplis << skill->objectName();
            Config.setValue("Duplicated", duplis);
        }

        skills.insert(skill->objectName(), skill);

        if(skill->isKindOf("ClientSkill"))
            client_skills << qobject_cast<const ClientSkill *>(skill);
        else if (skill->inherits("TargetModSkill"))
            targetmod_skills << qobject_cast<const TargetModSkill *>(skill);
    }
}

QList<const ClientSkill *> Engine::getClientSkills() const{
    return client_skills;
}

QList<const TargetModSkill *> Engine::getTargetModSkills() const{
    return targetmod_skills;
}

void Engine::addPackage(Package *package){
    if(findChild<const Package *>(package->objectName()))
        return;

    package->setParent(this);

    QList<Card *> all_cards = package->findChildren<Card *>();
    foreach(Card *card, all_cards){
        if(card->getNumber() < 0)
            continue;
        card->setId(cards.length());
        cards << card;

        QString card_name = card->objectName();
        metaobjects.insert(card_name, card->metaObject());
    }

    addSkills(package->getSkills());

    QList<General *> all_generals = package->findChildren<General *>();
    foreach(General *general, all_generals){
        addSkills(general->findChildren<const Skill *>());

        if(general->isHidden()){
            hidden_generals.insert(general->objectName(), general);
            continue;
        }

        if(general->isLord())
            lord_list << general->objectName();
        else
            nonlord_list << general->objectName();

        if(generals.contains(general->objectName())){
            if(!Config.value("MuteLoad", false).toBool())
                QMessageBox::warning(NULL, "", tr("Duplicated general : %1").arg(general->objectName()));
            QVariantList duplis = Config.value("Duplicated", QVariant()).toList();
            duplis << general->objectName();
            Config.setValue("Duplicated", duplis);
        }
        generals.insert(general->objectName(), general);
    }

    QList<const QMetaObject *> metas = package->getMetaObjects();
    foreach(const QMetaObject *meta, metas)
        metaobjects.insert(meta->className(), meta);

    patterns.unite(package->getPatterns());
    related_skills.unite(package->getRelatedSkills());
}

void Engine::addBanPackage(const QString &package_name){
    ban_package.insert(package_name);
}

QStringList Engine::getBanPackages() const{
    if(qApp->arguments().contains("-server"))
        return Config.BanPackages;
    else
        return ban_package.toList();
}

bool Engine::isDuplicated(const QString &name, bool is_skill){
    if(is_skill)
        return skills.contains(name);
    else
        return generals.contains(name);
}

bool Engine::isExist(const QString &str){
    return QFile::exists(str);
}

QString Engine::translate(const QString &to_translate, bool return_null) const{
    return translations.value(to_translate, return_null ? QString() : to_translate);
}

int Engine::getRoleIndex() const{
    if(ServerInfo.GameMode == "06_3v3")
        return 2;
    else if(ServerInfo.EnableHegemony)
        return 3;
    else if(ServerInfo.GameMode == "landlord")
        return 4;
    else if(ServerInfo.GameMode == "warlords")
        return 5;
    else
        return 1;
}

const CardPattern *Engine::getPattern(const QString &name) const{
    const CardPattern * ptn = patterns.value(name, NULL);
    if(ptn)return ptn;

    return new ExpPattern(name);
}

QList<const Skill *> Engine::getRelatedSkills(const QString &skill_name) const{
    QList<const Skill *> skills;
    foreach(QString name, related_skills.values(skill_name))
        skills << getSkill(name);

    return skills;
}

const Card *Engine::getCard(const QString &name) const{
    foreach(const Card *card, cards){
        if(card->objectName() == name || card->getSubtype() == name)
            return card;
    }
    return NULL;
}

const General *Engine::getGeneral(const QString &name) const{
    if(generals.contains(name))
        return generals.value(name);
    else
        return hidden_generals.value(name, NULL);
}

int Engine::getGeneralCount(bool include_banned) const{
    if(include_banned)
        return generals.size();

    int total = generals.size();
    QHashIterator<QString, const General *> itor(generals);
    while(itor.hasNext()){
        itor.next();
        const General *general = itor.value();
        if(ban_package.contains(general->getPackage()))
            total--;

        else if( (ServerInfo.GameMode.endsWith("p") ||
                  ServerInfo.GameMode.endsWith("pd") ||
                  ServerInfo.GameMode.endsWith("pz"))
                  && Config.value("Banlist/Roles").toStringList().contains(general->objectName()))
            total--;

        else if(ServerInfo.Enable2ndGeneral && BanPair::isBanned(general->objectName()))
            total--;

        else if(ServerInfo.EnableBasara &&
                Config.value("Banlist/Basara").toStringList().contains(general->objectName()))
            total -- ;

        else if(ServerInfo.EnableHegemony &&
                Config.value("Banlist/Hegemony").toStringList().contains(general->objectName()))
            total -- ;
    }

    return total;
}

const Card *Engine::getCard(int index) const{
    if(index < 0 || index >= cards.length())
        return NULL;
    else
        return cards.at(index);
}

Card *Engine::cloneCard(const QString &name, Card::Suit suit, int number) const{
    const QMetaObject *meta = metaobjects.value(name, NULL);
    if(meta){
        QObject *card_obj = meta->newInstance(Q_ARG(Card::Suit, suit), Q_ARG(int, number));
        card_obj->setObjectName(name);
        return qobject_cast<Card *>(card_obj);
    }else
        return NULL;
}

Card *Engine::cloneCard(const QString &name, const QString &suit_string, int number) const{
    Card::Suit suit = Card::String2Suit(suit_string);
    return cloneCard(name, suit, number);
}

SkillCard *Engine::cloneSkillCard(const QString &name) const{
    const QMetaObject *meta = metaobjects.value(name, NULL);
    if(meta){
        QObject *card_obj = meta->newInstance();
        SkillCard *card = qobject_cast<SkillCard *>(card_obj);
        return card;
    }else
        return NULL;
}

QString Engine::getVersionNumber() const{
    return GetConfigFromLuaState(lua, "version").toString();
}

QString Engine::getVersion() const{
    QString version_number = getVersionNumber();
    QString mod_name = getMODName();
    if(mod_name == "official")
        return version_number;
    else
        return QString("%1:%2").arg(version_number).arg(mod_name);
}

QString Engine::getVersionName() const{
    return GetConfigFromLuaState(lua, "version_name").toString();
}

QString Engine::getMODName() const{
    return GetConfigFromLuaState(lua, "mod_name").toString();
}

QStringList Engine::getExtensions(bool getall) const{
    QStringList extensions;
    QList<const Package *> packages = findChildren<const Package *>();
    foreach(const Package *package, packages){
        if(package->inherits("Scenario") && !getall)
            continue;

        extensions << package->objectName();
    }
    return extensions;
}

QStringList Engine::getLuaExtensions() const{
    QStringList extensions;
    QList<const Package *> packages = findChildren<const Package *>();
    foreach(const Package *package, packages){
        if(package->inherits("Scenario"))
            continue;
        if(package->getGenre() == Package::CPP)
            continue;
        extensions << package->objectName();
    }
    return extensions;
}

QStringList Engine::getKingdoms() const{
    static QStringList kingdoms;
    if(kingdoms.isEmpty())
        kingdoms = GetConfigFromLuaState(lua, "kingdoms").toStringList();

    return kingdoms;
}

QColor Engine::getKingdomColor(const QString &kingdom) const{
    static QMap<QString, QColor> color_map;
    if(color_map.isEmpty()){
        foreach(QString k, getKingdoms()){
            QString color_str = GetConfigFromLuaState(lua,  ("color_" + k).toAscii()).toString();
            QRegExp rx("#?([0-9A-F]{2})([0-9A-F]{2})([0-9A-F]{2})");
            if(rx.exactMatch(color_str)){
                QStringList results = rx.capturedTexts();
                int red = results.at(1).toInt(NULL, 16);
                int green = results.at(2).toInt(NULL, 16);
                int blue = results.at(3).toInt(NULL, 16);

                color_map.insert(k, QColor(red, green, blue));
            }
        }

        Q_ASSERT(!color_map.isEmpty());
    }

    return color_map.value(kingdom);
}

QString Engine::getSetupString() const{
    int timeout = Config.OperationNoLimit ? 0 : Config.OperationTimeout;
    QString flags;
    if(Config.FreeChooseGenerals || Config.FreeChooseCards)
        flags.append("F");
    if(Config.Enable2ndGeneral)
        flags.append("S");
    if(Config.EnableReincarnation)
        flags.append("R");
    if(Config.EnableScene)
        flags.append("C");
    if(Config.EnableSame)
        flags.append("T");
    if(Config.EnableEndless)
        flags.append("E");
    if(Config.EnableAnzhan)
        flags.append("Z");
    if(Config.EnableBasara)
        flags.append("B");
    if(Config.EnableHegemony)
        flags.append("H");
    if(Config.EnableAI)
        flags.append("A");
    if(Config.DisableChat)
        flags.append("M");

    if(Config.MaxHpScheme == 1)
        flags.append("1");
    else if(Config.MaxHpScheme == 2)
        flags.append("2");

    QString server_name = Config.ServerName.toUtf8().toBase64();
    QStringList setup_items;
    setup_items << server_name
            << Config.GameMode
            << QString::number(timeout)
            << Sanguosha->getBanPackages().join("+")
            << flags;

    return setup_items.join(":");
}

QMap<QString, QString> Engine::getAvailableModes() const{
    return modes;
}

QString Engine::getModeName(const QString &mode) const{
    if(modes.contains(mode))
        return modes.value(mode);
    else
        return tr("%1 [Scenario mode]").arg(translate(mode));
}

int Engine::getPlayerCount(const QString &mode) const{
    if(modes.contains(mode)){
        QRegExp rx("(\\d+)");
        int index = rx.indexIn(mode);
        if(index != -1)
            return rx.capturedTexts().first().toInt();
    }else{
        // scenario mode
        const Scenario *scenario = getScenario(mode);
        if(scenario)
            return scenario->getPlayerCount();
    }

    return -1;
}

void Engine::getRoles(const QString &mode, char *roles) const{
    int n = getPlayerCount(mode);

    if(mode == "02_1v1"){
        qstrcpy(roles, "ZN");
        return;
    }

    if(modes.contains(mode)){
        static const char *table1[] = {
            "",
            "",

            "ZF", // 2
            "ZFN", // 3
            "ZNFF", // 4
            "ZCFFN", // 5
            "ZCFFFN", // 6
            "ZCCFFFN", // 7
            "ZCCFFFFN", // 8
            "ZCCCFFFFN", // 9
            "ZCCCFFFFFN", // 10
            "ZCCCFFFFFNN", // 11
            "ZCCCFFFFFNNN"  // 12
        };

        static const char *table2[] = {
            "",
            "",

            "ZF", // 2
            "ZFN", // 3
            "ZNFF", // 4
            "ZCFFN", // 5
            "ZCFFNN", // 6
            "ZCCFFFN", // 7
            "ZCCFFFNN", // 8
            "ZCCCFFFFN", // 9
            "ZCCCFFFFNN", // 10
            "ZCCCFFFFFNN", // 11
            "ZCCCFFFFFNNN"  // 12
        };

        const char **table = mode.endsWith("d") ? table2 : table1;
        QString rolechar = table[n];
        if(mode.endsWith("z"))
            rolechar.replace("N", "C");
        else if(Config.EnableHegemony){
            rolechar.replace("F", "N");
            rolechar.replace("C", "N");
        }

        qstrcpy(roles, rolechar.toStdString().c_str());
    }else if(mode.startsWith("@")){
        if(n == 8)
            qstrcpy(roles, "ZCCCNFFF");
        else if(n == 6)
            qstrcpy(roles, "ZCCNFF");

    }else{
        const Scenario *scenario = getScenario(mode);
        if(scenario)
            scenario->getRoles(roles);
    }
}

QStringList Engine::getRoleList(const QString &mode) const{
    char roles[100];
    getRoles(mode, roles);

    QStringList role_list;
    for(int i=0; roles[i] != '\0'; i++){
        QString role;
        switch(roles[i]){
        case 'Z': role = "lord"; break;
        case 'C': role = "loyalist"; break;
        case 'N': role = "renegade"; break;
        case 'F': role = "rebel"; break;
        }
        role_list << role;
    }

    return role_list;
}

int Engine::getCardCount() const{
    return cards.length();
}

QList<Card*> Engine::getCards() const{
    return cards;
}

QStringList Engine::getLords(bool contain_banned) const{
    QStringList lords;

    // add intrinsic lord
    foreach(QString lord, lord_list){
        const General *general = generals.value(lord);

        if(general->getPackage() == "sp")
            continue;
        if(ban_package.contains(general->getPackage()))
            continue;
        if(!contain_banned){
            if(ServerInfo.GameMode.endsWith("p")
               || ServerInfo.GameMode.endsWith("pd")
               || ServerInfo.GameMode.endsWith("pz"))
                if (Config.value("Banlist/Roles", QStringList()).toStringList().contains(lord))
                    continue;
            if(Config.Enable2ndGeneral && BanPair::isBanned(general->objectName()))
                continue;
        }
        lords << lord;
    }

    return lords;
}

QStringList Engine::getRandomLords() const{
    QStringList banlist_ban;
    if(Config.EnableBasara)
        banlist_ban = Config.value("Banlist/basara").toStringList();

    if(Config.GameMode == "zombie_mode")
        banlist_ban.append(Config.value("Banlist/zombie").toStringList());
    else if((Config.GameMode.endsWith("p") ||
             Config.GameMode.endsWith("pz") ||
             Config.GameMode.endsWith("pd")))
        banlist_ban.append(Config.value("Banlist/Roles").toStringList());

    QStringList lords;

    foreach(QString alord, getLords()){
        if(banlist_ban.contains(alord))
            continue;

        lords << alord;
    }

    QStringList nonlord_list;
    foreach(QString nonlord, this->nonlord_list){
        const General *general = generals.value(nonlord);
        if(ban_package.contains(general->getPackage()))
            continue;

        if(Config.Enable2ndGeneral && BanPair::isBanned(general->objectName()))
            continue;

        if(banlist_ban.contains(general->objectName()))
            continue;

        nonlord_list << nonlord;
    }

    qShuffle(nonlord_list);

    int i;
    const static int extra = 2;
    for(i=0; i< extra; i++)
        lords << nonlord_list.at(i);

    return lords;
}

QStringList Engine::getLimitedGeneralNames(bool getall) const{
    QStringList general_names;
    QHashIterator<QString, const General *> itor(generals);
    while(itor.hasNext()){
        itor.next();
        if(getall || !ban_package.contains(itor.value()->getPackage()))
            general_names << itor.key();
    }
    if(getall){
        QHashIterator<QString, const General *> itpr(hidden_generals);
        while(itpr.hasNext()){
            itpr.next();
            general_names << itpr.key();
        }
    }
    if(Config.value("DisableQimen", false).toBool())
        general_names.removeOne("gongsunsheng");
    return general_names;
}

QStringList Engine::getRandomGenerals(int count, const QSet<QString> &ban_set) const{
    QStringList all_generals = getLimitedGeneralNames();
    QSet<QString> general_set = all_generals.toSet();

    Q_ASSERT(all_generals.count() >= count);

    if(Config.EnableBasara)
        general_set = general_set.subtract(Config.value("Banlist/Basara", QStringList()).toStringList().toSet());
    if(Config.EnableHegemony)
        general_set = general_set.subtract(Config.value("Banlist/Hegemony", QStringList()).toStringList().toSet());

    if(ServerInfo.GameMode.endsWith("p") || ServerInfo.GameMode.endsWith("pd") || ServerInfo.GameMode.endsWith("pz"))
        general_set.subtract(Config.value("Banlist/Roles", QStringList()).toStringList().toSet());

    all_generals = general_set.subtract(ban_set).toList();

    // shuffle them
    qShuffle(all_generals);

    QStringList general_list = all_generals.mid(0, count);
    //Q_ASSERT(general_list.count() == count);

    return general_list;
}

QList<int> Engine::getRandomCards() const{
    QList<int> list;
    if(Config.GameMode == "02_1v1"){
        list
                << 78 << 63 << 90 << 86 << 209 << 57 << 1 << 2 << 5 << 6 << 87 << 59 << 75
                << 77 << 31 << 46 << 47 << 147 << 103 << 81 << 82 << 51 << 23 << 24 << 95 << 195
                << 79 << 210 << 93 << 10 << 11 << 12 << 216 << 14 << 16 << 18 << 20 << 225 << 100
                << 55 << 35 << 36 << 89 << 60 << 25 << 40 << 41 << 28 << 43 << 44 << 53 << 30
                << 228 << 230 << 187 << 231;
        foreach(int id, list){
            int index = list.indexOf(id);
            id --;
            list.replace(index, id);
        }
        qShuffle(list);
        return list;
    }
    foreach(Card *card, cards){
        card->clearFlags();

        QStringList bancards = Config.value("Banlist/Cards", QStringList()).toStringList();
        if(bancards.contains(card->objectName()) || bancards.contains(card->getSubtype()))
            continue;

        const Scenario *scenario = getScenario(Config.GameMode);
        if(scenario){
            if(scenario->setCardPiles(card))
                continue;
        }
        else{
            if(getScenario(card->getPackage()))
                continue;
        }

        if(Config.GameMode == "06_3v3"){
            bool exclude_disaters = Config.value("3v3/ExcludeDisasters", true).toBool();
            if(exclude_disaters && card->isKindOf("Disaster"))
                continue;
            if(card->getPackage() == "gift")
                continue;
        }
        if(card->getPackage() == "new_3v3_card"){
            if(!(Config.GameMode == "06_3v3" && Config.value("3v3/UsingNewMode", false).toBool()))
                continue;
            else{
                list << card->getId();
                list.removeOne(98);
            }
        }
        else if(!ban_package.contains(card->getPackage()))
            list << card->getId();
    }

    qShuffle(list);

    return list;
}

QString Engine::getRandomGeneralName() const{
    return generals.keys().at(qrand() % generals.size());
}

QString Engine::getPackageInformation(const Package *package) const{
    QString info;
    if(package->getType() == Package::GeneralPack){
        if(package->objectName() == "customcards")
            return translate(package->objectName());
        QList<General *> generals = package->findChildren<General *>();
        int num = generals.count();
        foreach(General *general, generals){
            if(general->isHidden() || general->isTotallyHidden()){
                num --;
                continue;
            }
            //001 songjiang male 4HP kou
            QString text = QString("%1 %2 %3 %4 %5")
                           .arg(general->getId().left(3))
                           .arg(general->getNickname(true))
                           .arg(translate(general->getGenderString()))
                           .arg(general->getShowHp() + "HP")
                           .arg(translate(general->getKingdom(true)));
            info = info + "<br/>" + text;
        }
        QString head = tr("%1 package, total: %2").arg(translate(package->objectName())).arg(num);
        info = head + info;
    }
    else{
        QList<Card *> cards = package->findChildren<Card *>();
        int num = cards.count();
        info = tr("%1, total: %2").arg(translate(package->objectName())).arg(num);
    }
    return info;
}

void Engine::playAudio(const QString &name) const{
    playEffect(QString("audio/system/%1.ogg").arg(name));
}

void Engine::playEffect(const QString &filename) const{
#ifdef AUDIO_SUPPORT

    if(filename.isNull())
        return;

    Audio::play(filename);

#endif
}

void Engine::playSkillEffect(const QString &skill_name, int index) const{
    const Skill *skill = skills.value(skill_name, NULL);
    if(skill && Config.EnableSkillEffects)
        skill->playEffect(index);
}

void Engine::playCardEffect(const QString &card_name, bool is_male) const{
    QString path;
    if(card_name.startsWith("@")){
        if(!Config.EnableCardEffects)
            return;
        QString gender = is_male ? "male" : "female";
        path = QString("audio/card/%1/%2.ogg").arg(gender).arg(card_name);
    }
    else if(card_name.startsWith("E")){
        if(!Config.EnableEquipEffects)
            return;
        QString gender = is_male ? "male" : "female";
        path = QString("audio/equip/%1/%2.ogg").arg(gender).arg(card_name.mid(1));
        if(!QFile::exists(path)){
            path = QString("audio/equip/%1/%2.ogg").arg(gender).arg(card_name.mid(1) + "1");
            if(!QFile::exists(path))
                path = QString("audio/equip/%1/%2.ogg").arg(gender).arg(card_name.mid(1) + "2");
        }
        if(ClientInstance)
            ClientInstance->setLines(path);
    }
    else{
        const Card *card = findChild<const Card *>(card_name);
        if(card && Config.EnableCardEffects)
            path = card->getEffectPath(is_male);
    }

    playEffect(path);
}

QList<const Skill *> Engine::getSkills(const QString &package_name) const{
    QList<const Skill *> skills;
    const Package *package = Sanguosha->findChild<const Package *>(package_name);
    if(package && !package->inherits("CardPackage")){
        foreach(const Skill *skill, package->getSkills()){
            if(skill->isVisible() && skill->getFrequency() != Skill::NotSkill)
                skills << skill;
        }
        QList<General *> all_generals = package->findChildren<General *>();
        foreach(General *general, all_generals){
            foreach(const Skill *skill, general->findChildren<const Skill *>()){
                if(skill->isVisible() && skill->getFrequency() != Skill::NotSkill)
                    skills << skill;
            }
        }
    }
    return skills;
}

const Skill *Engine::getSkill(const QString &skill_name) const{
    return skills.value(skill_name, NULL);
}

QStringList Engine::getSkillNames() const{
    return skills.keys();
}

const TriggerSkill *Engine::getTriggerSkill(const QString &skill_name) const{
    const Skill *skill = getSkill(skill_name);
    if(skill)
        return qobject_cast<const TriggerSkill *>(skill);
    else
        return NULL;
}

const ViewAsSkill *Engine::getViewAsSkill(const QString &skill_name) const{
    const Skill *skill = getSkill(skill_name);
    if(skill == NULL)
        return NULL;

    if(skill->isKindOf("ViewAsSkill"))
        return qobject_cast<const ViewAsSkill *>(skill);
    else if(skill->isKindOf("TriggerSkill")){
        const TriggerSkill *trigger_skill = qobject_cast<const TriggerSkill *>(skill);
        return trigger_skill->getViewAsSkill();
    }else
        return NULL;
}

const ClientSkill *Engine::isProhibited(const Player *from, const Player *to, const Card *card) const{
    foreach(const ClientSkill *skill, client_skills){
        const ProhibitSkill *prohibit_skill = qobject_cast<const ProhibitSkill *>(skill);
        if(prohibit_skill && prohibit_skill->prohibitable(to) && skill->isProhibited(from, to, card))
            return skill;
        else if(!prohibit_skill && skill->isProhibited(from, to, card))
            return skill;
    }

    return NULL;
}

const ClientSkill *Engine::isPenetrate(const Player *from, const Player *to, const Card *card) const{
    foreach(const ClientSkill *skill, client_skills){
        if(skill->isSlashPenetrate(from, to, card))
            return skill;
    }

    return NULL;
}

int Engine::correctClient(const ClientSkill::ClientType type, const Player *from, const Player *to, const Card *slash) const{
    int x = 0;

    foreach(const ClientSkill *skill, client_skills){
        switch(type){
        case ClientSkill::MaxCard : {
            int y = skill->getExtra(from);
            if(y < 0) // fixed maxcard
                return y;
            else
                x += y;
            break;
        }
        case ClientSkill::Distance : {
            x += skill->getCorrect(from, to);
            break;
        }
        case ClientSkill::Residue : {
            int y = skill->getSlashResidue(from);
            if(y < -200) // use slash never
                return y;
            x += y;
            break;
        }
        case ClientSkill::AttackRange : {
            int y = skill->getSlashRange(from, to, slash);
            if(y < 0) // fixed attack range
                return y;
            if(y > x) // use longest range
                x = y;
            break;
        }
        case ClientSkill::ExtraGoals : {
            x += skill->getSlashExtraGoals(from, to, slash);
            break;
        }
        default:
            break;
        }
    }

    //if(slash == NULL)
    //    slash = cloneCard("slash", Card::NoSuit, 0);
    if(slash){
        switch(type){
        case ClientSkill::Residue :
            x += correctCardTarget(TargetModSkill::Residue, from, slash);
            break;
        case ClientSkill::AttackRange :
            x += correctCardTarget(TargetModSkill::DistanceLimit, from, slash);
            break;
        case ClientSkill::ExtraGoals :
            x += correctCardTarget(TargetModSkill::ExtraTarget, from, slash);
            break;
        default:
            break;
        }
    }

    return x;
}

int Engine::correctCardTarget(const TargetModSkill::ModType type, const Player *from, const Card *card) const{
    int x = 0;

    foreach(const TargetModSkill *skill, targetmod_skills){
        ExpPattern sp(skill->getPattern());
        if(sp.match(from, card)){
            switch(type){
            case TargetModSkill::Residue : {
                int history = from->usedTimes(card->getClassName());
                if(card->isKindOf("Slash"))
                    history = from->getSlashCount();
                x += qMax(1 + skill->getResidueNum(from, card) - history, 0);
                break;
            }
            case TargetModSkill::DistanceLimit : {
                x += skill->getDistanceLimit(from, card);
                break;
            }
            case TargetModSkill::ExtraTarget : {
                x += skill->getExtraTargetNum(from, card);
                break;
            }
            default:
                break;
            }
        }
    }

    return x;
}

bool Engine::useNew3v3(){
    return Config.GameMode == "06_3v3" && Config.value("3v3/UsingNewMode", false).toBool();
}

bool Engine::is3v3Friend(const ServerPlayer *a, const ServerPlayer *b){
    QChar c = a->getRole().at(0);
    return b->getRole().startsWith(c);
}
