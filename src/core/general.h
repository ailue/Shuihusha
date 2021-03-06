#ifndef GENERAL_H
#define GENERAL_H

class Skill;
class TriggerSkill;
class Package;
class QSize;

#include <QObject>
#include <QSet>
#include <QMap>
#include <QStringList>

class General : public QObject
{
    Q_OBJECT
    Q_ENUMS(Gender)
    Q_PROPERTY(QString kingdom READ getKingdom CONSTANT)
    Q_PROPERTY(int maxhp READ getMaxHp CONSTANT)
    Q_PROPERTY(bool male READ isMale STORED false CONSTANT)
    Q_PROPERTY(bool female READ isFemale STORED false CONSTANT)
    Q_PROPERTY(Gender gender READ getGender WRITE setGender)
    Q_PROPERTY(bool lord READ isLord CONSTANT)
    Q_PROPERTY(bool hidden READ isHidden CONSTANT)

public:
    enum Gender {Male = 0, Female = 1, Neuter = 2};
    enum Attrib {Shown = 1, Hidden = 0, NeverShown = -1};
    explicit General(Package *package, const QString &name, const QString &kingdom, int max_hp = 4, bool male = true, bool hidden = false, bool never_shown = false);
    explicit General(Package *package, const QString &name, const QString &kingdom, const QString &show_hp, Gender gender = Male, Attrib attrib = Shown);

    // property getters/setters
    int getMaxHp() const {return max_hp;}
    int getHp() const {return _hp;}
    QString getKingdom(bool unmap = false) const;
    bool isMale() const {return gender == Male;}
    bool isFemale() const {return gender == Female;}
    bool isNeuter() const {return gender == Neuter;}
    bool isLord() const {return lord;}
    bool isHidden() const {return attrib == Hidden || attrib == NeverShown;}
    bool isTotallyHidden() const {return attrib == NeverShown;}
    bool isLuaGeneral() const;

    Gender getGender() const {return gender;}
    void setGender(Gender gender);
    void setGenderString(const QString &sex);
    QString getGenderString() const;

    void addSkill(Skill* skill);
    void addSkill(const QString &skill_name);
    bool hasSkill(const QString &skill_name) const;
    QList<const Skill *> getVisibleSkillList() const;
    QSet<const Skill *> getVisibleSkills() const;
    QSet<const TriggerSkill *> getTriggerSkills() const;

    void addRelateSkill(const QString &skill_name);
    QStringList getRelatedSkillNames() const;

    QString getPixmapPath(const QString &category) const;
    QString getPackage() const;
    QString getSkillDescription() const;
    QString getLastword() const;
    QString getWinword() const;
    QString getId() const;
    QString getNickname(bool full = false) const;
    QString getShowHp() const {return show_hp;}
    QString getResume() const;

    static QSize BigIconSize;
    static QSize SmallIconSize;
    static QSize TinyIconSize;

public slots:
    void lastWord() const;
    void winWord() const;

private:
    void init(const QString &name);
    QString kingdom;
    int max_hp, _hp;
    QString show_hp;
    Gender gender;
    bool lord;
    QSet<QString> skill_set;
    QSet<QString> extra_set;
    QStringList related_skills;
    Attrib attrib;
    bool hidden;
    bool never_shown;
    QMap<QString, QString> kmap;
};

#endif // GENERAL_H
