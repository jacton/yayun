import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'themestate.dart';

class ThemeLogic extends GetxController {
  final ThemeState state = ThemeState();

  //切换主题
  void onChangeTheme() {
    print('onChangeTheme');
    if (state.themeSelect == ThemeStatus.themeWhite) {
      state.themeSelect = ThemeStatus.themeBlack;
    } else {
      state.themeSelect = ThemeStatus.themeWhite;
    }

    switch (state.themeSelect) {
      case ThemeStatus.themeWhite:
        //白色
        state.bgThemeColor = Colors.white;
        state.textThemeColor = Colors.black;
        state.btnBrightness = Brightness.light;
        state.themedata = state.themeDataWhite;
        print('onChangeThemewhite');
        break;
      case ThemeStatus.themeBlack:
        //黑色
        state.bgThemeColor = Color(0xFF212332);
        state.textThemeColor = Colors.white;
        state.btnBrightness = Brightness.dark;
        state.themedata = state.themeDataBlack;
        print('onChangeThemeblack');
        break;
    }
    update(["theme"]);
  }
}
