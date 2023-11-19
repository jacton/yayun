import 'package:flutter/material.dart';
import 'package:yayun/const/image_config.dart';
import 'package:yayun/components/yayun/state.dart';
import 'package:yayun/const/function.dart';
import 'package:yayun/windows/custom_single_child_scroll_view.dart';
import 'package:yayun/windows/windows_adapter.dart';
import 'package:get/get.dart';

import '../logic.dart';

class YayunLeftNavigation extends StatelessWidget {
  const YayunLeftNavigation({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  final YayunState data;

  final ParamSingleCallback<YayunSubItemInfo> onTap;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      //logo图标
      _buildLogo(),

      //遍历俩层循环：不同item栏目 - 可点击,可滑动
      //第一层：标题 + 子item列表
      //第二层：子item详细布局
      _buildItemListBg(itemBuilder: (item) {
        return [
          //最外层item - 大标题
          _buildTitle(item.title),

          //子栏目 - 列表
          _buildSubItemListBg(item, subBuilder: (subItem) {
            return [
              //选中红色长方形条块
              _buildRedTag(subItem),

              //图标
              _buildItemIcon(subItem),

              //描述
              _buildItemDesc(subItem),
            ];
          })
        ];
      }),
    ]);
  }

  Widget _buildItemDesc(YayunSubItemInfo subItem) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: GetBuilder<YayunLogic>(
        builder: (logic) {
          return Text(
            subItem.title,
            style: TextStyle(
              color: subItem.isSelected ? Colors.lightGreen : Colors.white,
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemIcon(YayunSubItemInfo subItem) {
    return GetBuilder<YayunLogic>(
      builder: (logic) {
        return Icon(
          subItem.icon,
          size: 18,
          color: subItem.isSelected ? Colors.lightGreen : Colors.white60,
        );
      },
    );
  }

  Widget _buildRedTag(YayunSubItemInfo subItem) {
    return GetBuilder<YayunLogic>(
      builder: (logic) {
        return Container(
          height: 17,
          width: 2,
          color: subItem.isSelected ? Colors.lightGreen : Colors.transparent,
          margin: EdgeInsets.only(right: 21),
        );
      },
    );
  }

  Widget _buildSubItemListBg(
    YayunItemInfo item, {
    required List<Widget> Function(YayunSubItemInfo item) subBuilder,
  }) {
    return Column(
      children: List.generate(item.subItemList.length, (index) {
        return InkWell(
          onTap: () => onTap(item.subItemList[index]),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Row(children: subBuilder(item.subItemList[index])),
          ),
        );
      }),
    );
  }

  Widget _buildItemListBg({
    required List<Widget> Function(YayunItemInfo item) itemBuilder,
  }) {
    return Expanded(
      child: Scrollbar(
        child: CustomSingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(data.leftItemList.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: itemBuilder(data.leftItemList[index]),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.only(left: 23, top: 20, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(left: 0),
      child: Image.asset("assets/images/logo.png"),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return DragToMoveAreaNoDouble(
      child: Container(
        color: Colors.blueGrey.withOpacity(0.9),
        padding: EdgeInsets.only(top: 18),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
