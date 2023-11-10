import 'package:flutter/material.dart';
import 'package:yayun/components/yayun/state.dart';
import 'package:yayun/const/function.dart';

///猜你喜欢
class HimalayaGuess extends StatelessWidget {
  const HimalayaGuess({
    Key? key,
    required this.data,
    required this.onChange,
    required this.onGuess,
  }) : super(key: key);

  ///数据源
  final List<HimalayaSubItemInfo> data;

  ///换一批点击监听
  final ParamVoidCallback onChange;

  ///猜你喜欢具体栏目
  final ParamSingleCallback<HimalayaSubItemInfo> onGuess;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      //标题 + 换一批
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //标题
        _buildTitle(),

        //换一批
        _buildGuessChange()
      ]),

      //显示具体信息流
      _buildItemBg(itemBuilder: (item) {
        return [
          //图片卡片
          _buildPicCard(item),

          //文字描述
          Text(item.title,
              style: TextStyle(fontSize: 15, color: Colors.redAccent)),

          //子标题
          _buildSubTitle(item),
        ];
      })
    ]);
  }

  Widget _buildSubTitle(HimalayaSubItemInfo item) {
    return Text(
      '${item.subTitle}',
      style: TextStyle(fontSize: 13, color: Colors.grey),
    );
  }

  Widget _buildPicCard(HimalayaSubItemInfo item) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(top: 16, bottom: 6),
      decoration: const BoxDecoration(),
      child: GestureDetector(
        onTap: () => onGuess(item),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(item.tag ?? ''),
        ),
      ),
    );
  }

  Widget _buildItemBg({
    required List<Widget> Function(HimalayaSubItemInfo item) itemBuilder,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(data.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: itemBuilder(data[index]),
        );
      }),
    );
  }

  Widget _buildGuessChange() {
    return InkWell(
      onTap: onChange,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(children: [
          //图标
          const Icon(Icons.autorenew, size: 15),

          Container(width: 12),

          //文字
          Text(
            '换一批',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ]),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      '猜你喜欢',
      style: TextStyle(
        color: Colors.black,
        fontSize: 21,
      ),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      width: 800,
      margin: EdgeInsets.only(top: 38, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
