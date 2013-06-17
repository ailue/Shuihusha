-- translation for PurgatoryPackage

return {
	["purgatory"] = "生死之战",

	["specially"] = "特定牌",
	["cv:gift"] = "烨子风暴|Paddy",

	["chaos_slash"] = "乱战杀",
	[":chaos_slash"] = "出牌时机：出牌阶段\
使用目标：攻击范围内的一名其他角色\
作用效果：【杀】对目标角色造成1点伤害，然后你为目标角色随机附加一种咒术状态\
特殊限定：乱战【杀】的属性随机（无属性、火焰属性或雷电属性）",

	["chaos_jink"] = "乱战闪",
	[":chaos_jink"] = "出牌时机：不定\
使用目标：无\
作用效果：当你成为【杀】的目标时，可打出乱战【闪】用于抵消【杀】的效果，然后解除附加于你的咒术状态",

	["proud_banner"] = "日月星辰旗",
	[":proud_banner"] = "装备牌·防具\
防具效果：<b>锁定技</b>，若你的武将牌正面向上，则你的武将牌不能被翻面；若你的武将牌未横置，则你不能成为【铁索连环】的目标；附加于你的咒术状态的成功率始终-50%",
	["#ProudBanner1"] = "%from 装备的【%arg】生效，翻面被防止",
	["#ProudBanner2"] = "%from 装备的【%arg】生效，横置被防止",
	["#ProudBanner3"] = "%from 装备的【%arg】生效，%arg2咒术被防止",

	["lash_gun"] = "子母连锁炮",
	[":lash_gun"] = "装备牌·武器\
攻击范围：６\
武器特效：<b>锁定技</b>，你每使用【杀】对其他角色造成一次属性伤害，须为该角色的上家和下家附加“晕眩”状态",
	["#LashGun"] = "%from 装备的【%arg】生效",

	["mastermind"] = "摄魂",
	[":mastermind"] = "锦囊牌\
使用时机：出牌阶段\
使用目标：两名角色\
作用效果：指定一名角色为“生”、另一名角色为“死”（场上至多存在一名“生”角色和一名“死”角色）。“死”角色每受到一次伤害，“生”角色回复等同于该伤害的体力，直到回合结束",
	["@death"] = "死",
	["@life"] = "生",
	["#Mind"] = "%from 受到 %arg 效果影响",

	["spin_destiny"] = "扭转乾坤",
	[":spin_destiny"] = "锦囊牌\
使用时机：出牌阶段\
使用目标：所有存活和（在【扭转乾坤】结算前的）阵亡角色\
作用效果：每名存活角色失去1点体力，然后每名阵亡角色将其当前体力值调整至1并复活。\
★【扭转乾坤】对阵亡角色产生的作用效果生效前，不能被【无懈可击】响应。",

	["edo_tensei"] = "借尸还魂",
	[":edo_tensei"] = "锦囊牌\
使用时机：当任一角色进入濒死时\
使用目标：任一已阵亡角色\
作用效果：目标角色将其当前体力值调整至1，摸三张牌并复活，然后该濒死角色立即死亡。",
	["@edo"] = "%src 进入濒死状态，你可以使用【借尸还魂】复活一名已死亡角色",

	["shit"] = "伪信",
	[":shit"] = "基本牌\
<b>特定效果</b>：你的回合内，当此牌从你的手牌进入弃牌堆时，你受到1点属性与该牌花色相应且来源为你的伤害（或流失体力）：♠~流失体力；♥~火焰属性；♣~雷电属性；♦~无属性",
	["$ShitHint"] = "%from 的 %card 败露",
}

