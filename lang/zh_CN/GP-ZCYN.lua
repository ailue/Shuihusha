-- ZhechongYannan Shuihusha part 5.

return {
	["ZCYN"] = "折冲厌难",

	["#_guansheng"] = "大刀",
	["guansheng"] = "关胜",
	["tongwu"] = "通武",
	[":tongwu"] = "当你使用的【杀】被【闪】抵消时，你可以获得该【闪】并交给除目标角色外的任一角色。",

	["#_ruanxiaoer"] = "立地太岁",
	["ruanxiaoer"] = "阮小二",
	["fuji"] = "伏击",
	[":fuji"] = "其他角色的判定阶段开始时，若该角色的判定区里有牌，你可以弃置一张手牌，视为你对该角色使用了一张【行刺】（不能被【将计就计】或【无懈可击】响应）。",
	["@fuji"] = "%src 即将开始判定阶段，你可以弃一张手牌【伏击】之",

	["yangxiong"] = "杨雄",
	["#_yangxiong"] = "病关索",
	["designer:yangxiong"] = "裁之刃•散",
	["cv:yangxiong"] = "爪子",
	["guizi"] = "刽子",
	[":guizi"] = "每当其他角色进入濒死状态时，你可以弃置一张黑桃牌，令该角色立即死亡。若如此做，则视为你杀死该角色。",
	["#Guizi"] = "%from 发动了技能【%arg】，将 %to 拖出去宰掉了",
	["@guizi"] = "%src 正在死亡线上挣扎，你可以发动【刽子】，弃一张黑桃牌将其拖出去宰掉",
	["$guizi1"] = "午时已到，行刑！",
	["$guizi2"] = "斩！",
	["~yangxiong"] = "背疮疼痛，恨不能战死沙场～",

	["#_haosiwen"] = "井木犴",
	["haosiwen"] = "郝思文",
	["cv:haosiwen"] = "烨子",
	["sixiang"] = "四象",
	[":sixiang"] = "回合开始阶段，你可以弃置一张手牌，令至多X名角色（至少一名）依次将手牌调整至X张，X为场上现存势力数。若如此做，弃牌阶段，你至少须弃置等同于场上现存势力数的牌（不足则全弃）。每回合限一次。",
	["#SixiangBad"] = "%from 受到技能【%arg2】影响，必须至少弃掉 %arg 张牌",
	["#SixiangWorst"] = "%from 受到技能【%arg2】影响，弃掉了所有的装备和手牌（共 %arg 张）",
	["@sixiang"] = "你可以弃一张手牌发动技能【四象】",
	["$sixiang1"] = "青龙、白虎、朱雀、玄武！",
	["$sixiang2"] = "朱雀神鸟，为我先导！",
	["~haosiwen"] = "井宿八星，都陨落了。",

	["#_pengqi"] = "天目将",
	["pengqi"] = "彭玘",
	["tianyan"] = "天眼",
	[":tianyan"] = "其他角色的判定阶段开始时，若该角色的手牌数大于2，你可以观看牌堆顶的三张牌，并可以弃掉其中任意数量的牌。",

	["#_shiwengong"] = "大教师",
	["shiwengong"] = "史文恭",
	["dujian"] = "毒箭",
	[":dujian"] = "每当你使用【杀】对其他角色造成伤害时，若你不在该角色的攻击范围内，你可以防止该伤害，改为将该角色的武将牌翻面。",

	["lingzhen"] = "凌振",
	["#_lingzhen"] = "轰天雷",
	["cv:lingzhen"] = "专业",
	["coder:lingzhen"] = "凌天翼",
	["paohong"] = "炮轰",
	[":paohong"] = "<b>锁定技</b>，你的黑色普通【杀】均视为具雷电属性的【杀】；你使用具雷电属性的【杀】时无距离限制。",
	["$paohong1"] = "一炮就送你归天！",
	["$paohong2"] = "不投降就去死吧！",
	["~lingzhen"] = "啊！我不会倒下～",

	["zourun"] = "邹润",
	["#_zourun"] = "独角龙",
	["longjiao"] = "龙角",
	[":longjiao"] = "每当你成为非延时类锦囊的目标时，你可以摸两张牌，然后将其中的一张置于牌堆顶。",
	["#PutCard"] = "%from 把 1 张牌放置在了摸牌堆",

	["caifu"] = "蔡福",
	["#_caifu"] = "铁臂膊",
	["juesi"] = "诀死",
	[":juesi"] = "<b>锁定技</b>，每当你对其他角色造成伤害时，若该角色的当前体力值不大于1，则该伤害+1。",
	["#JuesiBuff"] = "%from 的锁定技【决死】被触发，对 %to 的伤害从 %arg 点上升至 %arg2 点",
}

