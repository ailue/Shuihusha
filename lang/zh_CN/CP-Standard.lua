-- translation for StandardPackage

local t = {
	["standard_cards"] = "基础卡牌包",

	["slash"] = "杀",
	[":slash"] = "基本牌\
出牌时机：出牌阶段\
使用目标：你攻击范围内的一名角色\
作用效果：你对目标角色造成1点伤害",
	["slash-jink"] = "%src 使用了【杀】，请使用一张【闪】",

	["jink"] = "闪",
	[":jink"] = "基本牌\
出牌时机：以你为目标的进攻牌开始结算时\
使用目标：以你为目标的进攻牌\
作用效果：抵消目标进攻牌对你产生的效果",
	["#Slash"] = "%from 对 %to 使用了【杀】",
	["#Jink"] = "%from 使用了【闪】",

	["peach"] = "烤山鸡",
	[":peach"] = "基本牌\
出牌时机：1.出牌阶段；2.当一名角色处于濒死状态时\
使用目标：1.你；2.处于濒死状态的一名角色\
作用效果：目标角色回复1点体力",

	["crossbow"] = "非攻",
	[":crossbow"] = "装备牌·武器\
攻击范围：1\
武器特效：锁定技，你使用进攻牌时无次数限制",

	["double_sword"] = "干将莫邪",
	[":double_sword"] = "装备牌·武器\
攻击范围：2\
武器特效：当你使用进攻牌指定一名异性角色为目标后，你可以令其选择一项：弃置一张手牌，或令你摸一张牌",
	["double-sword-card"] = "%src 发动了干将莫邪特效，你需弃置一张手牌或让 %src 摸一张牌",
	["double_sword:yes"] = "你可以令其选择一项：弃置一张手牌，或令你摸一张牌",

	["qinggang_sword"] = "渊虹",
	[":qinggang_sword"] = "装备牌·武器\
攻击范围：2\
武器特效：<b>锁定技</b>，当你使用进攻牌指定一名角色为目标后，无视其防具牌",

	["blade"] = "墨眉",
	[":blade"] = "装备牌·武器\
攻击范围：3\
武器特效：当你使用的进攻牌被【闪】抵消时，你可以对目标角色再使用一张进攻牌",
	["blade-slash"] = "你可以发动“墨眉无锋”，再对其使用一张进攻牌",

	["spear"] = "巨阙",
	[":spear"] = "装备牌·武器\
攻击范围：3\
武器特效：你可以将两张手牌当【杀】使用或打出",

	["axe"] = "太阿",
	[":axe"] = "装备牌·武器\
攻击范围：3\
武器特效：当你使用的进攻牌被【闪】抵消时，你可以弃置两张牌，则此进攻牌依然造成伤害",
	["@axe"] = "你可以弃置两张牌(包括装备区里的牌)使此进攻牌强制命中",
	["#AxeSkill"] = "%from 使用了【%arg】的技能，弃置了两张牌以对 %to 强制命中",

	["halberd"] = "破阵霸王枪",
	[":halberd"] = "装备牌·武器\
攻击范围：4\
武器特效：当你使用进攻牌时，若此进攻牌是你最后的手牌，你可以额外指定至多两个目标",

	["kylin_bow"] = "雷神锤",
	[":kylin_bow"] = "装备牌·武器\
攻击范围：5\
武器特效：当你使用进攻牌对目标角色造成伤害时，你可以弃置其装备区里的一张机关牌或坐骑牌",
	["kylin_bow:yes"] = "弃置其一张机关牌或坐骑牌",
	["kylin_bow:machine"] = "机关牌",
	["kylin_bow:mount"] = "坐骑牌",

	["eight_diagram"] = "幻音宝盒",
	[":eight_diagram"] = "装备牌·防具\
防具效果：当你需要使用或打出一张【闪】时，你可以进行一次判定，若判定结果为红色，则视为你使用或打出一张【闪】",
	["eight_diagram:yes"] = "进行一次判定，若判定结果为红色，则视为你使用或打出一张【闪】",

	["ex_cards"] = "EX卡牌包",

	["renwang_shield"] = "苍云甲",
	[":renwang_shield"] = "装备牌·防具\
防具效果：<b>锁定技</b>，黑色进攻牌对你无效",

	["ice_sword"] = "水寒",
	[":ice_sword"] = "装备牌·武器\
攻击范围：2\
武器特效：当你使用进攻牌对目标角色造成伤害时，若其有牌，你可以防止此伤害，改为弃置其两张牌",
	["ice_sword:yes"] = "你可以依次弃置其两张牌",

	[":machine"] = "装备牌·机关\
机关效果：其他角色计算与你的距离+1",
	["irondino"] = "玄武",
	["thunderbird"] = "朱雀",
	["whitetiger"] = "白虎",

	[":mount"] = "装备牌·坐骑\
坐骑效果：你计算与其他角色的距离-1",
	["windy"] = "大风",
	["snowy"] = "踏雪",
	["darky"] = "乌骓",

	["amazing_grace"] = "阳春白雪",
	[":amazing_grace"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：所有角色\
执行动作：你从牌堆顶亮出X张牌(X为现存角色数量)\
作用效果：每名目标角色获得其中一张牌",

	["god_salvation"] = "高山流水",
	[":god_salvation"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：所有角色\
作用效果：每名目标角色回复1点体力",

	["savage_assault"] = "横扫六国",
	[":savage_assault"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：所有其他角色\
作用效果：每名目标角色需打出一张进攻牌，否则受到你造成的1点伤害",
	["savage-assault-slash"] = "%src 使用了【横扫六国】，请打出一张【杀】",

	["archery_attack"] = "百步飞剑",
	[":archery_attack"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：所有其他角色\
作用效果：每名目标角色需打出一张【闪】，否则受到你造成的1点伤害",
	["archery-attack-jink"] = "%src 使用了【百步飞剑】，请打出一张【闪】",

	["collateral"] = "天罗地网",
	[":collateral"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：装备区里有武器牌的一名其他角色A\
执行动作：你指定A攻击范围内的一名角色B\
作用效果：A需对B使用一张进攻牌，否则你获得A装备区里的武器牌",
	["collateral-slash"] = "%src 使用了【天罗地网】，目标是 %dest，请使用一张进攻牌",

	["duel"] = "决斗",
	[":duel"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：一名其他角色\
作用效果：由目标角色开始，你与其轮流打出一张进攻牌，首先不打出进攻牌的一方受到另一方造成的1点伤害",
	["duel-slash"] = "%src 向你决斗，你需要与其轮流打出一张进攻牌",

	["ex_nihilo"] = "多多益善",
	[":ex_nihilo"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：你\
作用效果：摸两张牌",

	["snatch"] = "盗王之王",
	[":snatch"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：距离为1且区域里有牌的一名角色\
作用效果：你获得目标角色区域里的一张牌",

	["dismantlement"] = "庖丁解牛",
	[":dismantlement"] = "锦囊牌\
出牌时机：出牌阶段\
使用目标：区域里有牌的一名其他角色\
作用效果：你弃置目标角色区域里的一张牌",

	["nullification"] = "万里长城",
	[":nullification"] = "锦囊牌\
出牌时机：目标锦囊牌生效前\
使用目标：目标锦囊牌\
作用效果：抵消目标锦囊牌对一名角色产生的效果，或抵消另一张【万里长城】产生的效果",

	["indulgence"] = "鸩羽千夜",
	[":indulgence"] = "延时锦囊牌\
出牌时机：出牌阶段\
使用目标：一名其他角色\
执行动作：将【鸩羽千夜】置于目标角色的判定区里\
作用效果：若判定结果不为红桃，则目标角色跳过此回合的出牌阶段",

	["lightning"] = "六魂恐咒",
	[":lightning"] = "延时锦囊牌\
出牌时机：出牌阶段\
使用目标：你\
执行动作：将【六魂恐咒】置于你的判定区里\
作用效果：若判定结果为黑桃2-9，则目标角色受到3点阴阳伤害；若判定结果不为黑桃2-9，将之移动到下家的判定区里",

}

local machines = {"irondino", "thunderbird", "whitetiger", "blackdragon", "mirage"}
local mounts = {"windy", "snowy", "darky"}

for _, machine in ipairs(machines) do
	t[":" .. machine] = t[":machine"] -- +1
end

for _, mount in ipairs(mounts) do
	t[":" .. mount] = t[":mount"] -- -1
end

return t
