import 'package:flutter/material.dart';
import 'package:yayun/const/image_config.dart';
import 'package:yayun/const/function.dart';
import 'package:yayun/windows/window_buttons.dart';
import 'package:yayun/windows/windows_adapter.dart';

///搜索框 个人信息 设置等按钮
class YayunTopBar extends StatelessWidget {
  const YayunTopBar({
    Key? key,
    // required this.onRefresh,
    required this.onLeftArrow,
    required this.onRightArrow,
    required this.onSkin,
    required this.onChanged,
  }) : super(key: key);

  ///左右箭头回调
  final ParamVoidCallback onLeftArrow;
  final ParamVoidCallback onRightArrow;

  ///刷新回调
  // final ParamVoidCallback onRefresh;

  ///刷新回调
  final ParamVoidCallback onSkin;

  ///刷新回调
  // final ParamVoidCallback onSetting;

  ///输入框输入监听
  final ParamSingleCallback<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      SizedBox(
        width: 200,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //左图标
            _buildLeftArrow(),
            //右图标
            _buildRightArrow(),
          ],
        ),
      ),
      //搜索框
      Center(
        child: _buildSearch(),
      ),
      Row(
        children: [
          _buildSkin(),
          WindowButtons(),
        ],
      ),
    ]);
  }

  // Widget _buildRefresh() {
  //   return Container(
  //     margin: EdgeInsets.only(left: 30),
  //     child: IconButton(
  //       icon: const Icon(
  //         Icons.autorenew,
  //         size: 16,
  //         color: Colors.grey,
  //       ),
  //       onPressed: onRefresh,
  //     ),
  //   );
  // }

  Widget _buildRightArrow() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 16,
          color: Colors.grey,
        ),
        onPressed: onRightArrow,
      ),
    );
  }

  Widget _buildLeftArrow() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 16,
        color: Colors.grey,
      ),
      onPressed: onLeftArrow,
    );
  }

  // Widget _buildSetting() {
  //   return Container(
  //     margin: EdgeInsets.only(left: 15),
  //     child: IconButton(
  //       icon: const Icon(
  //         Icons.settings,
  //         color: Colors.grey,
  //         size: 20,
  //       ),
  //       onPressed: onSetting,
  //     ),
  //   );
  // }

  Widget _buildSkin() {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: IconButton(
        icon: const Icon(
          Icons.brightness_4,
          color: Colors.grey,
          size: 20,
        ),
        onPressed: onSkin,
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      height: 30,
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(children: [
        //搜索图标
        Container(
          margin: EdgeInsets.only(left: 10),
          child: const Icon(Icons.search, color: Colors.grey, size: 18),
        ),

        //输入框
        Container(
          width: 250,
          padding: EdgeInsets.only(left: 12),
          child: TextField(
            autofocus: false,
            textAlign: TextAlign.start,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
              ///较小空间时，使组件正常渲染，包括文本垂直居中
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(0.0),
            ),
            onChanged: onChanged,
          ),
        ),
      ]),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
