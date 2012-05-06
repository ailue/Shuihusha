-- translation for StandardGeneralPackage

return {
	["standard"] = "基础包",

	["#songjiang"] = "及时雨", -- kou 4hp (ttxd)
	["songjiang"] = "宋江",
	["designer:songjiang"] = "烨子&凌天翼",
	["cv:songjiang"] = "猎狐【声声melody】",
	["coder:songjiang"] = "宇文天启、凌天翼",
	["ganlin"] = "甘霖",
	[":ganlin"] = "出牌阶段，你可以将任意数量的手牌交给其他角色，然后你可以将手牌补至X张（X为你已损失的体力值）。额外的，你以此法补牌后，不能发动“甘霖”，直到回合结束。",
	["juyi"] = "聚义",
	[":juyi"] = "<font color=red><b>主公技</b></font>，其他寇势力角色可以在其出牌阶段与你交换手牌（你可以拒绝此交换）。每阶段限一次。",
	["jui"] = "聚义换牌",
	[":jui"] = "你可以和拥有【聚义】技能的主公交换手牌，每回合限一次",
	["jui:agree"] = "莫和大哥客气～（同意）",
	["jui:deny"] = "你是～细作！（拒绝）",
	["#Juyi"] = "%from 和 %to 交换了手牌",
	["$ganlin1"] = "扶危济困，急人所难。",
	["$ganlin2"] = "在下正是山东及时雨宋公明！",
	["$juyi1"] = "替天行道！",
	["$juyi2"] = "我等上应天星，合当聚义！",
	["~songjiang"] = "何时方能报效朝廷？",

	["#lujunyi"] = "玉麒麟", -- guan 4hp (ttxd)
	["lujunyi"] = "卢俊义",
	["cv:lujunyi"] = "猎狐【声声melody】",
	["coder:lujunyi"] = "roxiel",
	["baoguo"] = "报国",
	[":baoguo"] = "当其他角色受到伤害时，你可以弃置一张手牌，将该伤害转移给你；你每受到一次伤害，可以摸X张牌（X为你已损失的体力值）。",
	["@baoguo"] = "你可以弃置一张手牌发动【报国】，将 %src 受到的 %arg 点伤害转移给你",
	["#Baoguo"] = "%from 发动了技能【%arg】，将 %to 受到的 %arg2 点伤害转移给了自己",
	["$baoguo1"] = "大丈夫为国尽忠，死而无憾！",
	["$baoguo2"] = "与其坐拥金山，不如上阵杀敌！",
	["~lujunyi"] = "我、生为大宋人，死为大宋鬼！",

	["#wuyong"] = "智多星", -- kou 3hp (cgdk)
	["wuyong"] = "吴用",
	["huace"] = "画策",
	[":huace"] = "出牌阶段，你可以将你的任一锦囊牌或事件牌当任一非延时类锦囊使用。每阶段限一次。",
	["stt"] = "单目标锦囊",
	["mtt"] = "多目标锦囊",
	["yunchou"] = "运筹",
	[":yunchou"] = "当你使用一张非延时类锦囊时，（在结算前）你可以摸一张牌。",
	["$huace1"] = "运筹帷幄之中，决胜千里之外！",
	["$huace2"] = "此事我早有计较。",
	["$yunchou1"] = "呵呵～雕虫小技！",
	["$yunchou2"] = "天机不可泄露。",
	["~wuyong"] = "八百里水泊，化作南柯一梦。",

	["#gongsunsheng"] = "入云龙", -- kou 3hp (ttxd)
	["gongsunsheng"] = "公孙胜",
	["cv:gongsunsheng"] = "流岚【裔美声社】",
	["yixing"] = "移星",
	[":yixing"] = "在任一角色的判定牌生效前，你可以用任一角色装备区里的一张牌替换之。",
	["@yixing"] = "你可以发动【移星】技能来修改 %src 的 %arg 判定",
	["qimen"] = "奇门",
	[":qimen"] = "任一角色的回合开始时，你可以令除你外的任一角色进行一次判定，若你弃置一张与判定结果花色相同的牌，则该角色不能发动其当前的所有技能，直到回合结束。",
	["@qimen"] = "%src 判定牌的花色为 %arg，请弃置与其相同花色的牌",
	["#Qimen"] = "%from 的【%arg】发动成功，%to 不能发动当前的所有技能直到回合结束",
	["#QimenEnd"] = "%to 解除了【%arg】的影响",
	["#QimenClear"] = "%from 终于死了，【%arg】随之失效，%to 喜笑颜开",
	["$yixing1"] = "天命有旋转，地星而应之。",
	["$yixing2"] = "夜道极阴，昼道极阳。",
	["$qimen1"] = "汝逢大凶，不宜出兵再战。",
	["$qimen2"] = "小奇改门户，大奇变格局。",
	["~gongsunsheng"] = "天罡尽已归天界，地煞还应入地中。",

	["#guansheng"] = "大刀", -- jiang 4hp (zcyn)
	["guansheng"] = "关胜",
	["tongwu"] = "通武",
	[":tongwu"] = "当你使用的【杀】被【闪】抵消时，你可以将该【闪】交给除目标角色外的任一角色。",
	["$tongwu1"]= "十八般武艺，何言难哉!",
	["$tongwu2"]= "攻敌，以长击短；克己，扬长避短!",
	["~guansheng"] = "愧对家祖啊！",

	["#linchong"] = "豹子头", -- jiang 4hp (xzdd)
	["linchong"] = "林冲",
	["cv:linchong"] = "猎狐【声声melody】",
	["duijue"] = "对决",
	[":duijue"] = "你每使用【杀】造成一次伤害或受到一次【杀】造成的伤害，可以令除你之外的一名角色进行一次判定：若结果不为黑桃，则视为你对其使用了一张【决斗】（不能被【无懈可击】或【将计就计】响应）。",
	["@duijue"] = "你可以指定一名其他角色进行【对决】",
	["$duijue1"] = "吾乃八十万禁军教头，豹子头林冲是也！",
	["$duijue2"] = "一枪在手，试问天下英雄！",
	["~linchong"] = "神枪绕指柔，家恨何人报！",

	["#huarong"] = "小李广", -- guan 4hp (qjwm)
	["huarong"] = "花荣",
	["cv:huarong"] = "烨子【剪刀剧团】",
	["jingzhun"] = "精准",
	[":jingzhun"] = "<b>锁定技</b>，出牌阶段，若你与目标角色的距离等于你的攻击范围，则你对该角色使用的【杀】不可被闪避。",
	["#Jingzhun"] = "%from 的锁定技【%arg】被触发，%to 不可闪避",
	["kaixian"] = "开弦",
	[":kaixian"] = "回合开始阶段，你可以展示一张点数不大于5的手牌，若如此做，你的攻击范围视为该牌的点数直到回合结束。",
	["@kaixian"] = "请展示一张点数不大于5的手牌，你的攻击范围将视为该牌的点数直到回合结束",
	["$Kaixian"] = "%from 展示了 %card，本回合 %from 的攻击范围视为 %card 的点数",
	["$jingzhun1"] = "箭迸寒星！",
	["$jingzhun2"] = "百发百中！",
	["$kaixian1"] = "弓开秋月分明。",
	["$kaixian2"] = "汝等可敢踏前一步？！",
	["~huarong"] = "宋大哥！",

	["#chaijin"] = "小旋风", -- guan 3hp (ttxd)
	["chaijin"] = "柴进",
	["designer:chaijin"] = "烨子&小花荣",
	["cv:chaijin"] = "烨子【剪刀剧团】",
	["coder:chaijin"] = "roxiel、宇文天启",
	["danshu"] = "丹书",
	[":danshu"] = "<b>锁定技</b>，当其他角色使用【杀】指定你为目标时，须额外弃置X张手牌，X为你已损失的体力值，否则该【杀】对你无效。",
	["#Danshu"] = "%to 的锁定技【%arg】被触发， %from 必须再弃掉 %arg2 张手牌，否则该【杀】对 %to 无效",
	["haoshen"] = "豪绅",
	[":haoshen"] = "你可以跳过你的摸牌阶段，令任一其他角色将手牌补至其体力上限的张数；你可以跳过你的出牌阶段，将一半的手牌（向上取整）交给任一其他角色。",
	["@haoshen-draw"] = "你可以令一名角色将手牌补至其体力上限的张数",
	["@haoshen-play"] = "你可以选择将一半的手牌（向上取整）交给一名其他角色",
	["$danshu1"] = "丹书铁券在此，刀斧不得加身！",
	["$danshu2"] = "御赐丹书铁券，可保祖孙三代！",
	["$haoshen1"] = "以吾万贯家财，助你一臂之力。",
	["$haoshen2"] = "吾好结交天下各路英雄。",
	["$haoshen3"] = "碎银铺路，富贵如云。",
	["$haoshen4"] = "既是兄弟，理应有福同享。",
	["~chaijin"] = "辞官回乡罢了～",

	["#zhutong"] = "美髯公", -- guan 4hp (xzdd)
	["zhutong"] = "朱仝",
	["designer:zhutong"] = "烨子&喀什葛尔胡杨",
	["cv:zhutong"] = "爪子",
	["sijiu"] = "私救",
	[":sijiu"] = "出牌阶段，你可以弃置一张【肉】，令一名已受伤角色回复1点体力。",
	["yixian"] = "义先",
	[":yixian"] = "每当你对其他角色造成伤害时，你可以防止此伤害，改为弃掉该角色区域内的一张牌。若如此做，你摸一张牌。",
	["$Yixian"] = "%from 弃掉了 %to 的 %card，抵消了 %to 受到的伤害",
	["$yixian1"] = "事不宜迟，兄弟快走！",
	["$yixian2"] = "上山藏起来！这边我自有计较。",
	["~zhutong"] = "小衙内，叔叔又要来找你玩儿了！",

	["#luzhishen"] = "花和尚", -- kou 4hp (qjwm)
	["luzhishen"] = "鲁智深",
	["cv:luzhishen"] = "流岚【裔美声社】",
	["liba"] = "力拔",
	[":liba"] = "出牌阶段，当你使用【杀】对目标角色造成伤害时，你可以展示该角色的一张手牌：若此牌不为基本牌，则你弃掉这张牌且该伤害+1。",
	["$ForceDiscardCard"] = "%from 弃掉了 %to 的 %card",
	["zuohua"] = "坐化",
	[":zuohua"] = "<b>锁定技</b>，杀死你的角色不能执行奖惩。",
	["#Zuohua"] = "%from 的锁定技【%arg】被触发，%to 不能执行奖惩",
	["$liba1"] = "哪用如此罗嗦，连根拔起便是！",
	["$liba2"] = "打甚鸟紧，看洒家的。",
	["$zuohua2"] = "听潮而圆，听信而寂。",
	["$zuohua1"] = "钱塘江上潮信来，今日方知我是我。",

	["#wusong"] = "行者", -- kou 4hp (qjwm)
	["wusong"] = "武松",
	["fuhu"] = "伏虎",
	["cv:wusong"] = "猎狐【声声melody】",
	[":fuhu"] = "其他角色每使用【杀】造成一次伤害，你可以弃置一张基本牌，视为你对该角色使用了一张【杀】，若该基本牌为【酒】，则该【杀】造成的伤害+1。",
	["@fuhu"] = "你可以弃置一张基本牌，发动【伏虎】（视为对 %src 使用一张【杀】）",
	["$Fuhu"] = "%from 弃置了 %card，这张【杀】具有伤害+1的效果",
	["$fuhu1"] = "小小大虫，有何可惧？",
	["$fuhu2"] = "哨棒断了，俺还有一双拳头！",
	["~wusong"] = "天人归天，这就是命啊！",

	["#yangzhi"] = "青面兽", -- guan 4hp (xzzd)
	["yangzhi"] = "杨志",
	["cv:yangzhi"] = "猎狐【声声melody】",
	["maidao"] = "卖刀",
	[":maidao"] = "出牌阶段，你可以将一张武器牌置于你的武将牌上，称为“刀”；其他角色可以在他们各自的出牌阶段交给你两张手牌，然后获得任意一张“刀”。\
★如果杨志没刀，则其他角色不能发动本技能。两项效果皆不限发动次数。",
	["knife"] = "刀",
	["maida0"] = "买刀",
	["fengmang"] = "锋芒",
	[":fengmang"] = "回合开始阶段，你可以将一张“刀”移入弃牌堆，视为你对任一其他角色使用了一张【杀】。若你与该角色的距离不大于该“刀”的攻击范围，则该【杀】不可被闪避。",
	["$maidao1"] = "何人能识此刀？",
	["$maidao2"] = "至此境地，卖刀求生。",
	["$maidao3"] = "这位买官好眼力！",
	["$maidao4"] = "三千贯，少一文不卖！",
	["$fengmang1"] = "砍铜剁铁，刀口不卷！",
	["$fengmang2"] = "吹毛得过！",
	["$fengmang3"] = "杀人不见血！",
	["~yangzhi"] = "无颜面对列祖列宗！",

	["#xuning"] = "金枪手", -- jiang 4hp (ybyt)
	["xuning"] = "徐宁",
	["cv:xuning"] = "猎狐【声声melody】",
	["coder:xuning"] = "战栗贵公子",
	["goulian"] = "钩镰",
	[":goulian"] = "每当你对武将牌处于横置状态的其他角色造成无属性伤害时，可以重置该角色的武将牌并弃掉其装备区里的所有马匹。",
	["jinjia"] = "金甲",
	[":jinjia"] = "<b>锁定技</b>，当你没装备防具时，始终视为你装备着【雁翎圈金甲】。",
	["#JinjiaNullify"] = "%from 的【%arg】技能被触发，【%arg2】对其无效",
	["#ThrowJinjiaWeapon"] = "%from 的技能【%arg】生效",
	["$goulian1"] = "钩、拨、搠、缴、攒、分、斗、夺！",
	["$goulian2"] = "钩镰枪并挠钩，正是此法。",
	["$jinjia1"] = "赛唐猊、刀枪不入！",
	["$jinjia2"] = "此甲：刀剑箭矢，急不能透！",
	["~xuning"] = "草！还我宝甲！",

	["#daizong"] = "神行太保", -- jiang 3hp (fcdc)
	["daizong"] = "戴宗",
	["mitan"] = "密探",
	[":mitan"] = "你可以将你的任一锦囊牌或事件牌当【探听】使用；你使用【探听】观看目标角色手牌时，可以展示其中的任意一张牌。",
	["jibao"] = "急报",
	[":jibao"] = "回合结束时，若你的手牌数与你本回合开始时的手牌数相等，则你可以弃置一张手牌。若如此做，则回合结束后，你进行一个额外的回合。",

	["#likui"] = "黑旋风", -- kou 4hp (xzdd)
	["likui"] = "李逵",
	["designer:likui"] = "凌天翼",
	["coder:likui"] = "凌天翼、宇文天启",
	["shalu"] = "杀戮",
	[":shalu"] = "出牌阶段，你每使用【杀】造成一次伤害，可以进行一次判定：若结果为黑色，你获得该判定牌并且此回合你可以额外使用一张【杀】。",
	["$shalu1"] = "吃我一斧！",
	["$shalu2"] = "嘿嘿～",
	["~likui"] = "呃～别高兴得太早了！",

	["#ruanxiaoqi"] = "活阎罗", -- min 4hp (cgdk)
	["ruanxiaoqi"] = "阮小七",
	["cv:ruanxiaoqi"] = "爪子",
	["jueming"] = "绝命",
	[":jueming"] = "<b>锁定技</b>，你的回合外，若你的当前体力值为1，你不能成为【杀】、【决斗】和【行刺】的目标。",
	["jiuhan"] = "酒酣",
	[":jiuhan"] = "你在你濒死状态下使用【酒】，可以额外回复1点体力。",
	["#Jiuhan"] = "%from 发动了【%arg】，额外回复 %arg2 点体力。",
	["$jueming1"] = "绝处逢生！",
	["$jueming2"] = "我，命不该绝！",
	["$jiuhan1"] = "啊！好酒！",
	["$jiuhan2"] = "吾先尝尝这御酒是何滋味。",
	["~ruanxiaoqi"] = "爷爷生在天地间，不求富贵不做官。",

	["#yangxiong"] = "病关索", -- jiang 4hp (zcyn)
	["yangxiong"] = "杨雄",
	["designer:yangxiong"] = "裁之刃•散",
	["cv:yangxiong"] = "爪子",
	["guizi"] = "刽子",
	[":guizi"] = "每当其他角色进入濒死状态时，你可以弃置一张黑桃牌，令该角色立即死亡。若如此做，则视为你杀死该角色。",
	["#Guizi"] = "%from 发动了技能【%arg】，将 %to 拖出去宰掉了",
	["@guizi"] = "%src 正在死亡线上挣扎，你可以发动【刽子】，弃一张黑桃牌将其拖出去宰掉",
	["$guizi1"] = "午时已到，行刑！",
	["$guizi2"] = "斩！",
	["~yangxiong"] = "背疮疼痛，恨不能战死沙场～",

	["#yanqing"] = "浪子", -- min 3hp (qjwm)
	["yanqing"] = "燕青",
	["dalei"] = "打擂",
	["cv:yanqing"] = "烨子【剪刀剧团】",
	[":dalei"] = "出牌阶段，你可以和一名男性角色拼点。若你赢，你获得以下技能直到回合结束：你每对该角色造成1点伤害，可以令除该角色外的任一角色回复1点体力。若你没赢，该角色对你造成1点伤害。每回合限一次。",
	["fuqin"] = "抚琴",
	[":fuqin"] = "你每受到一次伤害，可弃掉伤害来源的X张牌或令任一角色摸X张牌，X为你已损失的体力值。",
	["fuqin:yan"] = "弃掉伤害来源的X张牌",
	["fuqin:qing"] = "令任一角色摸X张牌",
	["fuqin:nil"] = "不发动",
	["#FuqinYan"] = "%from 发动了技能【%arg】，弃掉了 %to 的 %arg2 张牌",
	["#FuqinQin"] = "%from 发动了技能【%arg】，令 %to 摸了 %arg2 张牌",
	["$dalei1"] = "梁山好汉只需一人，便可溃汝相扑天下！",
	["$dalei2"] = "来，擂台上见真章！",
	["$fuqin1"] = "听听最后的旋律吧！",
	["$fuqin2"] = "一曲激昂助士气！",
	["~yanqing"] = "主人，小乙辜负你了。",

	["#andaoquan"] = "神医", -- min 3hp (ttxd)
	["andaoquan"] = "安道全",
	["cv:andaoquan"] = "东方胤弘【夜澜锦音】",
	["jishi"] = "济世",
	[":jishi"] = "任意角色的回合开始时，若该角色已受伤，你可以弃置一张手牌，令其回复1点体力。",
	["@jishi"] = "%src 受伤了，你可以发动【济世】，弃置一张手牌为 %src 回复1点体力。",
	["yanshou"] = "延寿",
	[":yanshou"] = "<font color=purple><b>限定技</b></font>，出牌阶段，你可以弃置两张红桃牌，令任一角色增加1点体力上限。",
	["@life"] = "命",
	["#Yanshou"] = "%from 为 %to 增加了 %arg 点体力上限",
	["$xuming"] = "伏望天慈，延你之寿。",
	["fengyue"] = "风月",
	[":fengyue"] = "回合结束阶段，你可以摸X张牌，X为场上存活的女性角色数且至多为2。每回合限一次。",
	["$yanshou"] = "助你延寿十年！",
	["$jishi1"] = "祖传内科外科尽皆医得。",
	["$jishi2"] = "回春之术！",
	["$fengyue1"] = "一生风月供惆怅。",
	["$fengyue2"] = "活色生香伴佳人。",
	["~andaoquan"] = "救人易，救己难！",

	["#husanniang"] = "一丈青", -- jiang 3hp (ttxd)
	["husanniang"] = "扈三娘",
	["cv:husanniang"] = "蒲小猫【夜澜锦音】",
	["hongjin"] = "红锦",
	[":hongjin"] = "出牌阶段，你每对男性角色造成一次伤害，可以执行下列两项中的一项：\
        1.摸一张牌；\
        2.弃掉该角色的一张牌。",
	["hongjin:draw"] = "摸一张牌",
	["hongjin:throw"] = "弃掉那臭男人的一张牌",
	["hongjin:cancel"] = "不发动",
	["wuji"] = "武姬",
	[":wuji"] = "出牌阶段，你可以弃置任意数量的【杀】，然后摸等量的牌。",
	["$hongjin1"] = "一击枫叶落！",
	["$hongjin2"] = "玉纤擒猛将，霜刀砍雄兵！",
	["$wuji1"] = "巾帼不让须眉！",
	["$wuji2"] = "连环铠甲衬红纱。",
	["~husanniang"] = "卿本佳人，奈何从贼？",

	["#sunerniang"] = "母夜叉", -- kou 3hp (cgdk)
	["sunerniang"] = "孙二娘",
	["cv:sunerniang"] = "九辨【重华剧社】",
	["heidian"] = "黑店",
	[":heidian"] = "<b>锁定技</b>，其他角色每对你造成一次伤害，须弃置一张手牌；每当其他角色失去最后一张手牌时，须交给你一张装备区里的牌，否则失去1点体力。",
	["@heidian1"] = "受 %src 的技能【黑店】影响，你必须选一张手牌弃掉",
	["@heidian2"] = "受 %src 的技能【黑店】影响，你必须给 %src 一张装备区里的牌，否则失去一点体力",
	["renrou"] = "人肉",
	[":renrou"] = "你可以立即获得死亡角色的所有牌，并以任意分配方式交给其他角色。", --遗计分牌
	["$heidian1"] = "由你奸似鬼，也吃老娘洗脚水！",
	["$heidian2"] = "灯蛾扑火，惹焰烧身！",
	["$renrou1"] = "给我活剥了！",
	["$renrou2"] = "客官，这可是上好的黄牛肉！",
	["~sunerniang"] = "就让这仇怨生根发芽吧。",

	["#gaoqiu"] = "殿帅府太尉", -- guan 3hp (ttxd)
	["gaoqiu"] = "高俅",
	["cv:gaoqiu"] = "爪子",
	["coder:gaoqiu"] = "roxiel、宇文天启",
	["hengxing"] = "横行",
	[":hengxing"] = "摸牌阶段，若你未受伤，可以额外摸X张牌，X为已死亡的角色数且至多为2.",
	["cuju"] = "蹴鞠",
	[":cuju"] = "每当你受到伤害时，可以进行一次判定：若为黑色，你可以弃置一张手牌，将该伤害转移给任一其他角色。",
	["panquan"] = "攀权",
	[":panquan"] = "<font color=red><b>主公技</b></font>，其他官势力角色每回复1点体力，可以令你摸两张牌，然后你将一张手牌置于牌堆顶。",
	["@cuju-card"] = "你可以弃置一张手牌，将该伤害转移给任一其他角色",
	["$hengxing1"] = "安敢辄入白虎节堂，可知法度否？",
	["$hengxing2"] = "哼！不认得我？！",
	["$cuju1"] = "看我入那风流眼！",
	["$cuju2"] = "有此绝技，休想伤我！",
	["$panquan1"] = "圣上有旨！",
	["$panquan2"] = "共求富贵！",
	["~gaoqiu"] = "报应啊～报应！",

	["#caijing"] = "奸相", -- guan 3hp (fcdc)
	["caijing"] = "蔡京",
	["jiashu"] = "家书",
	[":jiashu"] = "出牌阶段，你可以将一张手牌交给任一其他角色并你声明一种花色，若该角色交给你一张你所声明花色的手牌，则其摸一张牌，否则失去1点体力。每阶段限一次。",
	["duoquan"] = "夺权",
	[":duoquan"] = "<font color=purple><b>限定技</b></font>，当任一其他角色死亡时，若杀死该角色的不是你，则你可以获得该角色的所有牌和一项技能（主公技、限定技和觉醒技除外）。",

	["#fangla"] = "永乐圣公", -- jiang 4hp (bwqz)
	["fangla"] = "方腊",
	["yongle"] = "永乐",
	[":yongle"] = "出牌阶段，你可以分别获得至多X名其他角色的一张手牌，X为场上现存势力数，然后你分别交给这些角色一张手牌。每回合限一次。",
	["zhiyuan"] = "支援",
	[":zhiyuan"] = "<font color=red><b>主公技</b></font>，每当你失去最后一张手牌时，其他将势力角色可以交给你一张手牌。",
	["@zhiyuan"] = "%src 失去了最后一张手牌，你可以【支援】其一张手牌",
	["$yongle1"] = "人人为公，天下大同！",
	["$yongle2"] = "有福同享，有难同当！",
	["$zhiyuan1"] = "再续钱粮！",
	["$zhiyuan2"] = "吾大军援兵何在？",
	["~fangla"] = "打虎武松，不过如此。",

	["#wangqing"] = "楚王", -- min 4hp (qjwm)
	["wangqing"] = "王庆",
	["qibing"] = "起兵",
	["cv:wangqing"] = "猎狐【声声melody】",
	[":qibing"] = "<b>锁定技</b>，摸牌阶段，你摸牌的数量为你的当前体力值且至多为4。",
	["jiachu"] = "假楚",
	[":jiachu"] = "<font color=red><b>主公技</b></font>，其他民势力角色每受到1点伤害，可弃置一张红桃牌，令你回复1点体力。",
	["@jiachu"] = "你可以弃置一张红桃牌，令 %src 回复1点体力",
	["$qibing1"] = "吾军势大，霸业可成！",
	["$qibing2"] = "有此八州，天子可推，天下可得！",
	["$jiachu1"] = "江山已固。",
	["$jiachu2"] = "好一片繁华景象！",
	["~wangqing"] = "来世再不渡清江。",

	["#panjinlian"] = "墙头杏", -- min 3hp (qlfd)
	["panjinlian"] = "潘金莲",
	["designer:panjinlian"] = "烨子&凌天翼",
	["cv:panjinlian"] = "鬼心【⑤品倦客】",
	["yushui"] = "鱼水",
	[":yushui"] = "出牌阶段，你可弃置一张红桃牌并指定一名已受伤的男性角色：你和该角色各回复1点体力，各摸两张牌并将各自的武将牌翻面。每回合限一次。",
	["zhensha"] = "鸩杀",
	[":zhensha"] = "<font color=purple><b>限定技</b></font>，当其他角色使用【酒】时（在结算前），你可以弃置一张黑桃手牌，令该角色立即死亡。",
	["#Zhensha"] = "%from 发动了技能【%arg】，%to 一命归西",
	["@zhensha"] = "%src 使用了【酒】，你可以趁机弃置一张黑桃手牌，将其毒死。",
	["@vi"] = "鸩酒",
	["shengui"] = "深闺",
	[":shengui"] = "<b>锁定技</b>，若你的武将牌背面朝上，你不能成为男性角色使用锦囊的目标。",
	["$yushui1"] = "叔叔，请留步。",
	["$yushui2"] = "官人～",
	["$zhensha"] = "大郎，都喝了吧。",
	["$shengui1"] = "小女子从未踏出家门半步。",
	["$shengui2"] = "奴家有夫家了。",
	["~panjinlian"] = "大错铸成两命丧，风吹败柳赴黄泉。",

	["#lishishi"] = "绝色", -- jiang 3hp (fcdc)
	["lishishi"] = "李师师",
	["coder:lishishi"] = "皇叔",
	["qinxin"] = "沁心",
	[":qinxin"] = "回合开始时，你可以声明一种花色并进行一次判定：若结果为你所声明的花色，则你回复1点体力，否则你获得该判定牌。",
	["yinjian"] = "引荐",
	[":yinjian"] = "出牌阶段，你可以指定两名势力不同的男性角色。你交给其中一名角色两张手牌，然后该角色交给另一名角色一张手牌。每阶段限一次。",

	["#yanxijiao"] = "花魁女", -- min 3hp (qlfd)
	["yanxijiao"] = "阎惜娇",
	["suocai"] = "索财",
	[":suocai"] = "出牌阶段，你可以和一名男性角色拼点。若你赢，你获得双方拼点的牌。若你没赢，该角色对你造成1点伤害。每回合限一次。",
	["huakui"] = "花魁",
	[":huakui"] = "距离1以内的任意角色每受到一次伤害，你可以摸一张牌。",
	["$suocai1"] = "速将百两黄金于我！",
	["$suocai2"] = "你竟敢勾结梁山贼寇！",
	["$huakui1"] = "哼！你们都是绿叶！",
	["$huakui2"] = "艳压群芳，魅惑众人。",
	["~yanxijiao"] = "别管我，你快走……",

}

