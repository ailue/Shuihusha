-- translation for OxPackage

return {
	["ox"] = "臭妞",

	["#gaolian"] = "高唐魔君", -- guan 3hp (ybyt)
	["gaolian"] = "高廉",
	["coder:gaolian"] = "战栗贵公子",
	["guibing"] = "鬼兵",
	[":guibing"] = "每当你需要使用或打出一张【杀】时，你可以进行一次判定：若结果为黑色，则视为你使用或打出了一张【杀】。否则（若回合内使用）你不能发动“鬼兵”直到回合结束。\
★若判定结果为红色，则你仍可以从手牌中使用或打出一张【杀】。\
★回合内装备【飞燕弩】发动“鬼兵”后若判定为红色，则不能再发动“鬼兵”，但你仍可以通过其他方式使用【杀】。",
	["heiwu"] = "黑雾",
	[":heiwu"] = "出牌阶段，你可以将任意数量的手牌以任意顺序置于牌堆顶或牌堆底。",
	["#GuanxingResult"] = "%from 将 %arg 张牌放到了牌堆顶，将 %arg2 张牌放到了牌堆底",

	["#tongguan"] = "广阳郡王", -- guan 4hp (bwqz)
	["tongguan"] = "童贯",
	["aoxiang"] = "媪相",
	[":aoxiang"] = "<b>锁定技</b>，若你已受伤，则你视为女性角色。",
	["zhengfa"] = "征伐",
	[":zhengfa"] = "出牌阶段，你可以和一名与你性别不同且没受伤的角色拼点。若你赢，则你可以分别对你攻击范围内的至多X名其他角色造成1点伤害，X为你当前的体力值。若你没赢，你须将你的武将牌翻面。每回合限一次。",
	["@zhengfa-effect"] = "征伐成功！你可以分别对你攻击范围内的至多X名其他角色造成1点伤害，X为你当前的体力值",
	["$zhengfa1"] = "区区草寇，何足为患？",
	["$zhengfa2"] = "就此一并剿灭了！",
	["$zhengfa3"] = "区区草寇，何足为患？",
	["$zhengfa4"] = "就此一并剿灭了！",
	["$zhengfa5"] = "前有伏兵，后有追兵，似此如之奈何？",
	["$zhengfa6"] = "前有伏兵，后有追兵，似此如之奈何？",
	["~tongguanf"] = "各位好汉，切莫动手啊！",

	["#tongguanf"] = "广阴郡王",
	["tongguanf"] = "童公公",
	["yan"] = "阉",

	["#huyanzhuo"] = "双鞭", -- guan 4hp (fcdc)
	["huyanzhuo"] = "呼延灼",
	["coder:huyanzhuo"] = "Slob",
	["lianma"] = "链马",
	[":lianma"] = "出牌阶段，你可以选择一项：横置所有装备区里有坐骑牌的角色的武将牌，或重置所有装备区里没有坐骑牌的角色的武将牌。每阶段限一次。",
	["lianma:lian"] = "链起来！",
	["lianma:ma"] = "解链！",
	["zhongjia"] = "重甲",
	[":zhongjia"] = "<b>锁定技</b>，你的手牌上限+X（X为处于连环状态的现存角色数）。",

	["#dongchaoxueba"] = "黑狱吏", -- jiang 4hp (yxqd)
	["dongchaoxueba"] = "董超薛霸",
	["coder:dongchaoxueba"] = "Slob",
	["sheru"] = "折辱",
	[":sheru"] = "出牌阶段，你可以弃置一张♠或♣基本牌指定一名已受伤的其他角色并选择一项：1.令其摸X张牌并失去1点体力；2.弃掉其X张牌并令其回复1点体力（X为该角色已损失的体力值）。每回合限一次。",
	["sheru:she"] = "摸X张牌并失去1点体力",
	["sheru:ru"] = "弃掉其X张牌并令其回复1点体力",

	["#pangwanchun"] = "小养由基", -- jiang 4hp (fcdc)
	["pangwanchun"] = "庞万春",
	["designer:pangwanchun"] = "烨子&宇文天启",
	["lianzhu"] = "连珠",
	[":lianzhu"] = "出牌阶段，若你的武将牌正面向上，则你可以将你的武将牌翻面，视为你使用一张【万箭齐发】（目标角色需连续打出两张【闪】，否则受到你对其造成的1点火焰伤害）。 ",
	["#Lianzhu"] = "%from 的锁定技【%arg】被触发，%to 需要打出两张【闪】",
	["@lianzhu2jink"] = "%src 拥有技能【连珠】，你须再出一张【闪】",
	["~pangwanchun"] = "中埋伏了……",

	["#huangxin"] = "镇三山", -- jiang 4hp (xzdd)
	["huangxin"] = "黄信",
	["designer:huangxin"] = "烨子&裁之刃·散",
	["cv:huangxin"] = "流岚【裔美声社】",
	["tongxia"] = "统辖",
	[":tongxia"] = "摸牌阶段，你可以放弃摸牌，改为亮出牌堆顶的三张牌，将其中的装备牌分别置于任意角色的装备区里(能替换原装备)，并将其余的牌以任意分配方式交给任意角色。",
	["$tongxia1"] = "穷兵黩武，动费万计。",
	["$tongxia2"] = "三地军需，由我调拨！",
	["~huangxin"] = "三山崛起，力不从心啊！",

	["#luozhenren"] = "半仙", -- kou 3hp (qjwm)
	["luozhenren"] = "罗真人",
	["cv:luozhenren"] = "东方胤弘【夜澜锦音】",
	["butian"] = "卜天",
	[":butian"] = "在任意角色的判定牌生效前，你可以弃置一张牌，观看牌堆顶的三张牌，将其中的任意一张牌与该判定牌进行交换。",
	["@butian-card"] = "请弃置一张牌，发动技能【卜天】（更改 %src 的 %arg 判定结果）",
	["huaxian"] = "化仙",
	[":huaxian"] = "当你进入濒死状态时，可以进行一次判定：若结果为红桃，你回复1点体力。",
	["$butian1"] = "掐指一算，万事尽知。",
	["$butian2"] = "天道？哈哈哈～",
	["$huaxian1"] = "脚著谢公屐，身登青云梯。",
	["$huaxian2"] = "天劫已度，上可登仙。",
	["~luozhenren"] = "灾祸易躲，天命难违。",

	["#lili"] = "催命判官", -- kou 3hp (cgdk)
	["lili"] = "李立",
	["cv:lili"] = "爪子",
	["duoming"] = "夺命",
	[":duoming"] = "每当你使用【杀】对其他角色造成一次伤害，若该角色没有手牌，你可以令其减1点体力上限。",
	["moucai"] = "谋财",
	[":moucai"] = "其他角色每受到一次伤害，若该角色的手牌数大于你的当前体力值，你可以获得其一张手牌。",
	["$duoming1"] = "杀了你，脏了我案板！",
	["$duoming2"] = "休想走出这店门！",
	["$moucai1"] = "人为财死，鸟为食亡！",
	["$moucai2"] = "钱财乃身外之物，你留着也没用了！",
	["~lili"] = "生不带来，死不带去。",

	["#shijin"] = "九纹龙", -- kou 4hp (qjwm)
	["shijin"] = "史进",
	["wubang"] = "舞棒",
	["cv:shijin"] = "烨子【剪刀剧团】",
	[":wubang"] = "其他角色的武器牌进入弃牌堆时，你可以获得之。",
	["xiagu"] = "侠骨",
	[":xiagu"] = "任意角色受到无属性伤害时，你可以弃置一张装备牌，令该伤害-1.",
	["@xiagu"] = "你可以弃置一张装备牌发动【侠骨】（令该伤害-1）",
	["$Xiagu"] = "%from 发动了【侠骨】，弃置了 %card，令 %to 受到的伤害 -1",
	["$wubang1"] = "哪位教头再来点拨？",
	["$wubang2"] = "看我耍枪弄棒！",
	["$xiagu1"] = "大郎在此，这厮休得无礼。",
	["$xiagu2"] = "诸位哥哥，小弟来挡！",
	["~shijin"] = "何以别离久，何以不得安。",

	["#lijun"] = "混江龙", -- min 3hp (yxqd)
	["lijun"] = "李俊",
	["nizhuan"] = "逆转",
	[":nizhuan"] = "当一张非延时类锦囊指定了多名目标角色时，（在结算前）你可以指定该锦囊的结算方向（顺时针或逆时针）。",
	["xishui"] = "戏水",
	[":xishui"] = "当你受到伤害时，可弃两张牌，防止此伤害；当你回复体力时，可摸两张牌，防止此回复；当你获得两张牌时，可回复一点体力，不获得；当你失去两张牌时，可以失去一点体力，不失去。（每次只能执行一种效果）",

	["#xiezhen"] = "两头蛇", -- min 4hp (fcdc)
	["xiezhen"] = "解珍",
	["cv:xiezhen"] = "烨子【剪刀剧团】",
	["xunlie"] = "巡猎",
	[":xunlie"] = "你可以弃置一张装备牌跳过你的摸牌阶段，获得除你外手牌数最多的一名角色的至多两张手牌（至少一张）。若你以此法获得的牌为一张，你摸一张牌。",
	["@xunlie"] = "你可以跳过摸牌阶段，发动【巡猎】",
	["get"] = "纳尼，还有牌？再拿一张！",
	["cancel"] = "不拿了",
	["$xunlie1"] = "金蛇弓响，虎狼难逃。",
	["$xunlie2"] = "吾这便去取讨大虫！",
	["~xiezhen"] = "顾不了那么多了！",

	["#linniangzi"] = "腊梅傲雪", -- min 3hp (qlfd)
	["linniangzi"] = "林娘子",
	["designer:linniangzi"] = "烨子&大Ｒ",
	["cv:linniangzi"] = "蒲小猫【夜澜锦音】",
	["shouwang"] = "守望",
	[":shouwang"] = "出牌阶段，你可以将一张【杀】交给任一男性角色，然后你摸一张牌或令该角色摸一张牌。每回合限一次。",
	["ziyi"] = "自缢",
	[":ziyi"] = "<font color=purple><b>限定技</b></font>，出牌阶段，若你已受伤，你可以令任一已受伤的男性角色回复2点体力，然后你立即死亡。",
	["@ziyi"] = "尼龙绳",
	["zhongzhen"] = "忠贞",
	[":zhongzhen"] = "每当你受到男性角色造成的伤害时，你可以和该角色拼点。若你赢，防止该伤害。",
	["#Zhongzhen"] = "%from 对 %to 造成的 %arg 点伤害被抵消",
	["$shouwang1"] = "官人（哭声）。",
	["$shouwang2"] = "待来年春时，与君一叙。",
	["$ziyi"] = "官人，恕我先走一步。",
	["$zhongzhen1"] = "怎可这般无礼？",
	["$zhongzhen2"] = "你若再上前一步，我便跳下去。",
	["~linniangzi"] = "官人，就此～别过！",

}
