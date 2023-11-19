import 'package:flutter/material.dart';
import 'package:yayun/components/yayun/widget/yayun_banner.dart';
import 'package:yayun/components/yayun/widget/yayun_guess.dart';
import 'package:yayun/components/yayun/widget/yayun_rank_list.dart';
import 'package:yayun/components/yayun/widget/yayun_topbar.dart';
import 'package:yayun/theme/themelogic.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';
import 'widget/yayun_main.dart';
import 'widget/yayun_left_navigation.dart';
import 'widget/yayun_newest.dart';

class YayunPage extends StatelessWidget {
  YayunPage({Key? key}) : super(key: key);

  final logic = Get.put(YayunLogic());
  final logicTheme = Get.find<ThemeLogic>();
  final state = Get.find<YayunLogic>().state;

  @override
  Widget build(BuildContext context) {
    return yayunBuildBody(children: [
      //左边导航栏
      YayunLeftNavigation(
        data: state,
        //导航栏item回调
        onTap: (YayunSubItemInfo item) => logic.navigationItem(item),
      ),

      //右边信息
      yayunBuildRightBody(children: [
        YayunTopBar(
          //搜索框输入监听
          onChanged: (String msg) => logic.onSearch(msg),
          //左箭头
          onLeftArrow: () => logic.dealLeftArrow(),
          //右箭头
          onRightArrow: () => logic.dealRightArrow(),
          //皮肤按钮
          onSkin: () => logicTheme.onChangeTheme(),
        ),

        //右侧信息流 - 可滑动部分
        yayunBuildScrollInfoListBg(children: [
          //轮播图
          YayunBanner(
            data: state.bannerList,
            //具体banner的监听
            onTap: (int index) => logic.clickBanner(index),
          ),

          //猜你喜欢
          YayunGuess(
            data: state.guessList,
            //换一批
            onChange: () => logic.guessChange(),
            //猜你喜欢具体卡片
            onGuess: (YayunSubItemInfo item) => logic.guessDetail(item),
          ),

          //最新精选
          YayunNewest(
            data: state,
            //分类标题
            onSortTitle: (item) => logic.sortTitle(item),
            //具体精选卡片
            onNewest: (YayunSubItemInfo item) => logic.onNewest(item),
          ),

          //各类榜单
          YayunRankList(
            data: state.rankList,
            //标题
            onTitle: (String title) => logic.rankTitle(title),
            //榜单上具体item
            onItem: (YayunSubItemInfo item) => logic.rankItem(item),
          ),
        ]),
      ]),
    ]);
  }
  /////////////////////////////////////
}
