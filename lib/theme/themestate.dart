import 'package:flutter/material.dart';

class ThemeState {
  //背景色
  late Color bgThemeColor;
  late Color textThemeColor;
  late String themeSelect;
  late ThemeData themedata;
  late Brightness btnBrightness;

  ThemeData themeDataBlack = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF212332),
  );
  ThemeData themeDataWhite = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeState() {
    bgThemeColor = Colors.white;
    textThemeColor = Colors.black;
    themeSelect = ThemeStatus.themeWhite; //默认白色主题
    themedata = themeDataWhite;
    btnBrightness = Brightness.light;
  }
}

class ThemeStatus {
  static const String themeBlack = 'themeBlack';
  static const String themeWhite = 'themeWhite';
}
