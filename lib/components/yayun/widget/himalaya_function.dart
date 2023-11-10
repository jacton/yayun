import 'package:flutter/material.dart';
import 'package:yayun/windows/custom_single_child_scroll_view.dart';

///喜马拉雅整体外层布局设置
Widget himalayaBuildBg({required List<Widget> children}) {
  return Scaffold(
    // backgroundColor: Colors.white,
    body: Column(children: children),
  );
}

///播放控制栏上面的外层布局设置
Widget himalayaBuildTopBg({required List<Widget> children}) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

///顶部右侧信息流外层布局设置
Widget himalayaBuildInfoListBg({required List<Widget> children}) {
  return Expanded(
    child: Column(children: children),
  );
}

///顶部右侧信息流外层布局设置 - 可滑动部分
Widget himalayaBuildScrollInfoListBg({required List<Widget> children}) {
  return Expanded(
    child: ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.red),
      ),
      child: CustomSingleChildScrollView(
        child: SizedBox(
          width: 860,
          child: Column(children: children),
        ),
      ),
    ),
  );
}
