import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'windows/windows_adapter.dart';
import 'components/yayun/view.dart';
import 'theme/themelogic.dart';

void main() {
  runApp(MyApp());
  WindowsAdapter.setSize();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({Key? key}) : super(key: key);

  final logic = Get.put(ThemeLogic());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeLogic>(
      id: "theme",
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '雅韵',
        theme: logic.state.themedata,
        home: HimalayaPage(),
      ),
    );
  }
}
