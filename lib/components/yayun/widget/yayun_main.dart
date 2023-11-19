import 'package:flutter/material.dart';
import 'package:yayun/windows/custom_single_child_scroll_view.dart';

Widget yayunBuildBody({required children}) {
  return Scaffold(
    // backgroundColor: Colors.white,
    body: Row(children: children),
  );
}

///右侧信息
Widget yayunBuildRightBody({required List<Widget> children}) {
  return Expanded(
    child: SizedBox(
      // color: Colors.blue,
      child: Column(children: children),
    ),
  );
}

//滚动页面
Widget yayunBuildScrollInfoListBg({required List<Widget> children}) {
  return Expanded(
    child: ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.red),
      ),
      child: CustomSingleChildScrollView(
        child: SizedBox(
          // width: 860,
          child: Column(children: children),
        ),
      ),
    ),
  );
}
