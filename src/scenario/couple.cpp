#include "couple.h"

class CoupleScenarioRule: public ScenarioRule{
public:
    CoupleScenarioRule(Scenario *scenario)
        :ScenarioRule(scenario)
    {
        events << GameStart << GameOverJudge << Death;
    }

    virtual bool trigger(TriggerEvent event, Room* room, ServerPlayer *player, QVariant &data) const{
        const CoupleScenario *scenario = qobject_cast<const CoupleScenario *>(parent());

        switch(event){
        case GameStart:{
                if(player->isLord()){
                    scenario->marryAll(room);
                    room->setTag("SkipNormalDeathProcess", true);
                }else if(player->getGeneralName() == "linchong"){
                    if(player->askForSkillInvoke("reselect"))
                        room->transfigure(player, "gaoyanei", true);
                }else if(player->getGeneralName() == "yangxiong2"){
                    if(player->askForSkillInvoke("reselect"))
                        room->transfigure(player, "peiruhai", true);
                }else if(player->getGeneralName() == "zhangsan"){
                    if(player->askForSkillInvoke("reselect"))
                        room->transfigure(player, "lisi", true);
                }

                break;
            }

        case GameOverJudge:{
                if(player->isLord()){
                    scenario->marryAll(room);
                }else if(player->getGeneral()->isMale()){
                    ServerPlayer *loyalist = NULL;
                    foreach(ServerPlayer *player, room->getAlivePlayers()){
                        if(player->getRoleEnum() == Player::Loyalist){
                            loyalist = player;
                            break;
                        }
                    }
                    ServerPlayer *widow = scenario->getSpouse(player);
                    if(widow && widow->isAlive() && widow->getGeneral()->isFemale() && room->getLord()->isAlive() && loyalist == NULL)
                        scenario->remarry(room->getLord(), widow);
                }else if(player->getRoleEnum() == Player::Loyalist){
                    room->setPlayerProperty(player, "role", "renegade");

                    QList<ServerPlayer *> players = room->getAllPlayers();
                    QList<ServerPlayer *> widows;
                    foreach(ServerPlayer *player, players){
                        if(scenario->isWidow(player))
                            widows << player;
                    }

                    ServerPlayer *new_wife = room->askForPlayerChosen(room->getLord(), widows, "remarry");
                    if(new_wife){
                        scenario->remarry(room->getLord(), new_wife);
                    }
                }

                QList<ServerPlayer *> players = room->getAlivePlayers();
                if(players.length() == 1){
                    ServerPlayer *survivor = players.first();
                    ServerPlayer *spouse = scenario->getSpouse(survivor);
                    if(spouse)
                        room->gameOver(QString("%1+%2").arg(survivor->objectName()).arg(spouse->objectName()));
                    else
                        room->gameOver(survivor->objectName());

                    return true;
                }else if(players.length() == 2){
                    ServerPlayer *first = players.at(0);
                    ServerPlayer *second = players.at(1);
                    if(scenario->getSpouse(first) == second){
                        room->gameOver(QString("%1+%2").arg(first->objectName()).arg(second->objectName()));
                        return true;
                    }
                }

                return true;
            }

        case Death:{
                // reward and punishment
                DamageStar damage = data.value<DamageStar>();
                if(damage && damage->from){
                    ServerPlayer *killer = damage->from;

                    if(killer == player)
                        return false;

                    if(scenario->getSpouse(killer) == player)
                        killer->throwAllCards();
                    else
                        killer->drawCards(3);
                }
            }

        default:
            break;
        }

        return false;
    }
};

CoupleScenario::CoupleScenario()
    :Scenario("couple")
{
    //lord = "zhoutong";
    //renegades << "fangla" << "wangqing";
    rule = new CoupleScenarioRule(this);

    //map["ximenqing"] = "panjinlian";
    map["songjiang"] = "yanxijiao";
    //map["lujunyi"] = "jiashi";
    map["zhangqing"] = "qiongying";
    map["linchong"] = "linniangzi";
    map["wangying"] = "husanniang";
    map["qingzhang"] = "sunerniang";
    //map["sunxin"] = "gudasao";
    //map["wangqing"] = "duansanniang";
    map["yanqing"] = "lishishi";
    //map["yangxiong"] = "panqiaoyun";
    map["shijin"] = "liruilan";
    //map["andaoquan"] = "liqiaonu";
    //map["wusong"] = "yulan";
    //map["keyin"] = "fangjinzhi";
    //map["zhengtu"] = "jincuilian";
    map["sun_peiruhai"] = "moon_panqiaoyun";

    full_map = map;
    full_map["wuda"] = "panjinlian";
    full_map["gaoyanei"] = "linniangzi";
    full_map["chaijin"] = "fangjinzhi";
    full_map["jiangsong"] = "yanxijiao";
    full_map["peiruhai"] = "panqiaoyun";
    full_map["ligu"] = "jiashi";
    full_map["zhangsan"] = "lisi";
}

QMap<QString, QString> CoupleScenario::mappy(QMap<QString, QString> mapr) const{
    lua_State *lua = Sanguosha->getLuaState();
    QStringList spouses = GetConfigFromLuaState(lua, "couple_spouse", "scenario").toStringList();
    QMap<QString, QString> mapper = mapr;
    foreach(QString spouse, spouses){
        QStringList couple = spouse.split("+");
        mapper.insert(couple.first(), couple.last());
    }
    return mapper;
}

void CoupleScenario::marryAll(Room *room) const{
    QMap<QString, QString> mapper = mappy(map);
    QMap<QString, QString> full_mapper = mappy(full_map);

    foreach(QString husband_name, full_mapper.keys()){
        ServerPlayer *husband = room->findPlayer(husband_name, true);
        if(husband == NULL)
            continue;

        QString wife_name = mapper.value(husband_name, QString());
        if(!wife_name.isNull()){
            ServerPlayer *wife = room->findPlayer(wife_name, true);
            marry(husband, wife);
        }
    }
}

void CoupleScenario::setSpouse(ServerPlayer *player, ServerPlayer *spouse) const{
    if(spouse)
        player->tag["spouse"] = QVariant::fromValue(spouse);
    else
        player->tag.remove("spouse");
}

void CoupleScenario::marry(ServerPlayer *husband, ServerPlayer *wife) const{
    if(getSpouse(husband) == wife)
        return;

    LogMessage log;
    log.type = "#Marry";
    log.from = husband;
    log.to << wife;
    husband->getRoom()->sendLog(log);

    setSpouse(husband, wife);
    setSpouse(wife, husband);
}

void CoupleScenario::remarry(ServerPlayer *enkemann, ServerPlayer *widow) const{
    Room *room = enkemann->getRoom();

    ServerPlayer *ex_husband = getSpouse(widow);
    setSpouse(ex_husband, NULL);
    LogMessage log;
    log.type = "#Divorse";
    log.from = widow;
    log.to << ex_husband;
    room->sendLog(log);

    ServerPlayer *ex_wife = getSpouse(enkemann);
    if(ex_wife){
        setSpouse(ex_wife, NULL);
        LogMessage log;
        log.type = "#Divorse";
        log.from = enkemann;
        log.to << ex_wife;
        room->sendLog(log);
    }

    marry(enkemann, widow);
    room->setPlayerProperty(widow, "role", "loyalist");
}

ServerPlayer *CoupleScenario::getSpouse(const ServerPlayer *player) const{
    return player->tag["spouse"].value<PlayerStar>();
}

bool CoupleScenario::isWidow(ServerPlayer *player) const{
    if(player->getGender() == General::Male)
        return false;

    ServerPlayer *spouse = getSpouse(player);
    return spouse && spouse->isDead();
}

void CoupleScenario::assign(QStringList &generals, QStringList &roles) const{
    lua_State *lua = Sanguosha->getLuaState();
    QString zhoutong = GetConfigFromLuaState(lua, "couple_lord", "scenario").toString();
    generals << zhoutong;

    QMap<QString, QString> mapper = mappy(map);
    QStringList husbands = mapper.keys();
    qShuffle(husbands);
    husbands = husbands.mid(0, 4);

    QStringList others;
    foreach(QString husband, husbands)
        others << husband << mapper.value(husband);

    generals << others;
    qShuffle(generals);

    // roles
    int i;
    for(i=0; i<9; i++){
        if(generals.at(i) == zhoutong)
            roles << "lord";
        else
            roles << "renegade";
    }
}

int CoupleScenario::getPlayerCount() const{
    return 9;
}

void CoupleScenario::getRoles(char *roles) const{
    strcpy(roles, "ZNNNNNNNN");
}

bool CoupleScenario::generalSelection(Room *) const{
    return false;
}

AI::Relation CoupleScenario::relationTo(const ServerPlayer *a, const ServerPlayer *b) const{
    if(getSpouse(a) == b)
        return AI::Friend;

    if((a->isLord() || b->isLord()) && a->getGenderString() != b->getGenderString())
        return AI::Neutrality;

    return AI::Enemy;
}

ADD_SCENARIO(Couple)
