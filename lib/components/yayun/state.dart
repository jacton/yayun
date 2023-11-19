import 'package:flutter/material.dart';
import 'package:yayun/const/image_config.dart';

class YayunState {
  ///左边导航栏
  late List<YayunItemInfo> leftItemList;

  ///banner数据源
  late List<String> bannerList;

  ///猜你喜欢数据源
  late List<YayunSubItemInfo> guessList;

  ///最新精选数据源
  late List<YayunSubItemInfo> newestSortList;
  late List<YayunSubItemInfo> newestCardList;

  ///热门主播数据源
  late List<YayunSubItemInfo> anchorList;

  ///相关榜单
  late List<YayunItemInfo> rankList;

  ///音频播放信息
  late YayunSubItemInfo audioPlayInfo;

  late ScrollController scrollController;

  YayunState() {
    scrollController = ScrollController(initialScrollOffset: 50.0);

    //侧边导航栏目初始数据
    leftItemList = [
      YayunItemInfo(title: '推荐', subItemList: [
        YayunSubItemInfo(
          title: '发现',
          icon: Icons.explore,
          tag: YayunStatus.find,
          isSelected: true,
        ),
        YayunSubItemInfo(
          title: '诗文',
          icon: Icons.web,
          tag: YayunStatus.broadcast,
        ),
        YayunSubItemInfo(
          title: '名句',
          icon: Icons.wb_auto_outlined,
          tag: YayunStatus.fm,
        ),
        YayunSubItemInfo(
          title: '作者',
          icon: Icons.assessment_outlined,
          tag: YayunStatus.rank,
        ),
        YayunSubItemInfo(
          title: '朝代',
          icon: Icons.widgets_outlined,
          tag: YayunStatus.sort,
        ),
      ]),
      YayunItemInfo(title: '我的', subItemList: [
        YayunSubItemInfo(
          title: '收藏',
          icon: Icons.star_border,
          tag: YayunStatus.subscription,
        ),
      ]),
    ];

    //banner图片数据源
    bannerList = [
      ImageYayunConfig.bannerSeven,
      ImageYayunConfig.bannerTwo,
      ImageYayunConfig.bannerThree,
      ImageYayunConfig.bannerFour,
      ImageYayunConfig.bannerFive,
      ImageYayunConfig.bannerSix,
      ImageYayunConfig.bannerOne,
      ImageYayunConfig.bannerEight,
      ImageYayunConfig.bannerNine,
      ImageYayunConfig.bannerTen,
    ];

    //猜你喜欢：数据源
    guessList = [
      YayunSubItemInfo(
        title: '阿朵的柒十柒',
        subTitle: '阿朵',
        tag: ImageYayunConfig.guessOne,
      ),
      YayunSubItemInfo(
        title: '一星期一本书',
        subTitle: '一星期一本书',
        tag: ImageYayunConfig.guessTwo,
      ),
      YayunSubItemInfo(
        title: '武动乾坤(上部)',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.guessThree,
      ),
      YayunSubItemInfo(
        title: '那些好听的女生翻唱',
        subTitle: '花小小茵',
        tag: ImageYayunConfig.guessFour,
      ),
      YayunSubItemInfo(
        title: '斗罗之一锤99级',
        subTitle: '清时_Koln',
        tag: ImageYayunConfig.guessFive,
      ),
    ];

    //最新精选数据源
    newestSortList = [
      YayunSubItemInfo(title: '有声书', isSelected: true),
      YayunSubItemInfo(title: '个人成长', isSelected: false),
      YayunSubItemInfo(title: '人文', isSelected: false),
      YayunSubItemInfo(title: '外语', isSelected: false),
      YayunSubItemInfo(title: '娱乐', isSelected: false),
      YayunSubItemInfo(title: '商业财经', isSelected: false),
    ];
    newestCardList = [
      YayunSubItemInfo(
        title: '重生八零，媳妇有点辣',
        subTitle: '君颜讲故事',
        tag: ImageYayunConfig.featureOne,
      ),
      YayunSubItemInfo(
        title: '慕少，狠霸道',
        subTitle: '妙儿姐',
        tag: ImageYayunConfig.featureTwo,
      ),
      YayunSubItemInfo(
        title: '摸金天师（紫襟演播）',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.featureThree,
      ),
      YayunSubItemInfo(
        title: '猎罪者',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.featureFour,
      ),
      YayunSubItemInfo(
        title: '王的女人谁敢动',
        subTitle: '一刀苏苏',
        tag: ImageYayunConfig.featureFive,
      ),
      YayunSubItemInfo(
        title: '绝世高手【头陀渊】',
        subTitle: '头陀渊讲故事',
        tag: ImageYayunConfig.featureSix,
      ),
      YayunSubItemInfo(
        title: '中国民间故事',
        subTitle: '霄旭讲故事',
        tag: ImageYayunConfig.featureSeven,
      ),
      YayunSubItemInfo(
        title: '雪中悍刀行',
        subTitle: '大斌',
        tag: ImageYayunConfig.featureEight,
      ),
      YayunSubItemInfo(
        title: '我的老千江湖',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.featureNine,
      ),
      YayunSubItemInfo(
        title: '一剑独尊',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.featureTen,
      ),
    ];

    //热门主播数据源
    anchorList = [
      YayunSubItemInfo(
        title: '01',
        subTitle: '有声的紫襟',
        tag: ImageYayunConfig.anchorOne,
      ),
      YayunSubItemInfo(
        title: '02',
        subTitle: '头陀渊讲故事',
        tag: ImageYayunConfig.anchorTwo,
      ),
      YayunSubItemInfo(
        title: '03',
        subTitle: '果维听书',
        tag: ImageYayunConfig.anchorThree,
      ),
      YayunSubItemInfo(
        title: '04',
        subTitle: '_牛大宝_',
        tag: ImageYayunConfig.anchorFour,
      ),
      YayunSubItemInfo(
        title: '05',
        subTitle: '365读书',
        tag: ImageYayunConfig.anchorFive,
      ),
    ];

    //各类榜单源数据
    rankList = [
      YayunItemInfo(title: '经典免费榜', subItemList: [
        YayunSubItemInfo(
          title: '辽沈先声',
          subTitle: '辽沈晚报',
          tag: ImageYayunConfig.listClassicOne,
        ),
        YayunSubItemInfo(
          title: '郭德纲21年相声精选',
          subTitle: '德云社郭德纲相声VIP',
          tag: ImageYayunConfig.listClassicTwo,
        ),
        YayunSubItemInfo(
          title: '南都快讯',
          subTitle: '南方都市报',
          tag: ImageYayunConfig.listClassicThree,
        ),
        YayunSubItemInfo(
          title: '鲜快报',
          subTitle: '封面新闻',
          tag: ImageYayunConfig.listClassicFour,
        ),
        YayunSubItemInfo(
          title: '摸金天师（紫襟演播）',
          subTitle: '有声的紫襟',
          tag: ImageYayunConfig.listClassicFive,
        ),
      ]),
      YayunItemInfo(title: '有声书免费榜', subItemList: [
        YayunSubItemInfo(
          title: '摸金天师（紫襟演播）',
          subTitle: '有声的紫襟',
          tag: ImageYayunConfig.listSoundOne,
        ),
        YayunSubItemInfo(
          title: '猎罪者',
          subTitle: '有声的紫襟',
          tag: ImageYayunConfig.listSoundTwo,
        ),
        YayunSubItemInfo(
          title: '王的女人谁敢动',
          subTitle: '一刀苏苏',
          tag: ImageYayunConfig.listSoundThree,
        ),
        YayunSubItemInfo(
          title: '绝世高手',
          subTitle: '头陀渊讲故事',
          tag: ImageYayunConfig.listSoundFour,
        ),
        YayunSubItemInfo(
          title: '中国民间故事',
          subTitle: '霄旭讲故事',
          tag: ImageYayunConfig.listSoundFive,
        ),
      ]),
      YayunItemInfo(title: '相声评书免费榜', subItemList: [
        YayunSubItemInfo(
          title: '郭德纲21年相声精选',
          subTitle: '德云社郭德纲相声VIP',
          tag: ImageYayunConfig.listCrosstalkOne,
        ),
        YayunSubItemInfo(
          title: '郭德纲相声经典',
          subTitle: '德云社郭德纲相声VIP',
          tag: ImageYayunConfig.listCrosstalkTwo,
        ),
        YayunSubItemInfo(
          title: '岳云鹏孙越爆笑相声',
          subTitle: '岳云鹏相声',
          tag: ImageYayunConfig.listCrosstalkThree,
        ),
        YayunSubItemInfo(
          title: '岳云鹏孙越相声集',
          subTitle: '岳云鹏相声',
          tag: ImageYayunConfig.listCrosstalkFour,
        ),
        YayunSubItemInfo(
          title: '乱世枭雄 | 单田芳经典',
          subTitle: '单田芳评书',
          tag: ImageYayunConfig.listCrosstalkFive,
        ),
      ]),
    ];

    //音频播放数据源
    audioPlayInfo = YayunSubItemInfo(
      title: '雪中悍刀行 | 大斌&免费有声小说',
      subTitle: '《御龙行》徒有琴',
      tag: ImageYayunConfig.featureEight,
    );
  }
}

class YayunStatus {
  ///推荐
  static const String find = 'find';
  static const String broadcast = 'broadcast';
  static const String fm = 'fm';
  static const String rank = 'rank';
  static const String sort = 'sort';

  ///我听
  static const String subscription = 'subscription';
  static const String update = 'update';
  static const String download = 'download';
  static const String history = 'history';
  static const String shop = 'shop';

  ///我创建的听单
  static const String sound = 'sound';
  static const String music = 'music';
}

///侧边栏数据
class YayunItemInfo {
  YayunItemInfo({
    required this.title,
    required this.subItemList,
  });

  ///item名称
  String title;

  ///subItem列表
  List<dynamic> subItemList;
}

class YayunSubItemInfo {
  YayunSubItemInfo({
    required this.title,
    this.subTitle,
    this.tag,
    this.icon,
    this.isSelected = false,
  });

  ///按钮名称
  String title;

  ///子标题
  String? subTitle;

  ///按钮标识
  String? tag;

  ///正常情况图标
  IconData? icon;

  ///是否被选中
  bool isSelected;
}
