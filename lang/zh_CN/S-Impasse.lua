return {
	["impasse_fight"] = "四面楚歌",

	["silue"] = "思略",
	[":silue"] = "<b>锁定技</b>，摸牌阶段，你始终摸X张牌，X为你当前的体力值；\
	进入<font color=red>暴走状态</font>后，摸牌阶段始终从其他存活角色那各摸一张牌",
	["kedi"] = "克敌",
	[":kedi"] = "每当你受到1点伤害可以摸X张牌，X为你当前体力值；\
	进入<font color=red>暴走状态</font>后，每当你受到1点伤害可以摸X张牌，X为场上存活的角色数",
	["yuanyin"] = "援引",
	[":yuanyin"] = "<b>锁定技</b>，回合开始阶段，若你的手牌不大于X，你可以从除你以外每名角色那获得一张手牌，若目标角色无手牌，则失去一点体力。X为你当前体力值；\
	进入<font color=red>暴走状态</font>后，若目标角色无手牌，则失去两点体力。X为存活的角色数与你当前体力上限之和。\
	技能附效：你的手牌上限至多为存活的角色数。",
	["tiemu"] = "铁幕",
	[":tiemu"] = "<b>锁定技</b>，回合结束阶段，你可以摸X张牌。X为你当前体力值；\
	进入<font color=red>暴走状态</font>后，X为存活的角色数并获得额外技能效果：你的回合外，当你的手牌不大于存活的角色数时，若你成为锦囊牌的唯一目标，则该锦囊对你无效。\
	技能附效：你每次受到的伤害始终为1.",

	["guzhan"] = "孤战",
	[":guzhan"] = "<b>锁定技</b>，当你没装备武器时，你在出牌阶段使用【杀】无次数限制。",
	["jizhan"] = "激战",
	[":jizhan"] = "<b>锁定技</b>，出牌阶段，每当你对其他角色造成一点伤害时，你回复一点体力；当手牌小于存活的角色数时，你摸一张牌。",
	["duduan"] = "独断",
	[":duduan"] = "<b>锁定技</b>，你不能成为延时类锦囊的目标。",

	["#Baozou"] = "%from 进入暴走状态，拥有无视防具效果",
	["#BaozouOver"] = "%from 的暴走状态消失，[绝境之战]事件触发。每名角色开始进行判定",
	["#DajiAvoid"] = "%to 的技能【%arg2】被触发，%from 对 %to 使用的锦囊 %arg 无效",

	["@frantic"] = "暴走",

-- effect
	["$silue1"] = "深思熟虑，方可脱此绝境！", -- 未暴走
	["$silue2"] = "多虑无用，杀尽贼军便是！", -- 已暴走
	["$kedi1"] = "克敌制胜，方显英雄本色！",
	["$yuanyin1"] = "夺敌辎重，灭敌士气，壮吾军威！",
	["$tiemu1"] = "身处绝境，须当时时谨慎！", -- 未暴走
	["$tiemu2"] = "上天助吾，此危不日可解！", -- 已暴走
	["$jizhan1"] = "浴血激战，绝处逢生！", -- 回复体力
	["$jizhan2"] = "并夜酣战，俘斩无数！", -- 摸牌

	["$silue3"] = "深思熟虑，方可脱此绝境！", -- 未暴走
	["$silue4"] = "多虑无用，杀尽贼军便是！", -- 已暴走
	["$kedi2"] = "克敌制胜，方显英雄本色！",
	["$yuanyin2"] = "夺敌辎重，灭敌士气，壮吾军威！",
	["$tiemu3"] = "身处绝境，须当时时谨慎！", -- 未暴走
	["$tiemu4"] = "上天助吾，此危不日可解！", -- 已暴走
	["$jizhan3"] = "浴血激战，绝处逢生！", -- 回复体力
	["$jizhan4"] = "并夜酣战，俘斩无数！", -- 摸牌
}