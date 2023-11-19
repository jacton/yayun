import 'package:flutter/material.dart';
import 'package:yayun/components/yayun/state.dart';
import 'package:yayun/const/function.dart';

class YayunRankList extends StatelessWidget {
  const YayunRankList({
    Key? key,
    required this.data,
    required this.onItem,
    required this.onTitle,
  }) : super(key: key);

  ///数据源
  final List<YayunItemInfo> data;

  ///点击标题
  final ParamSingleCallback<String> onTitle;

  ///点击具体item
  final ParamSingleCallback<YayunSubItemInfo> onItem;

  @override
  Widget build(BuildContext context) {
    return _buildBg(builder: (YayunItemInfo item) {
      return [
        //标题
        _buildTitle(item.title),

        //榜单
        _buildItemBg(item, builder: (int index) {
          return [
            //名次
            _buildItemRank(index),

            //图标
            buildItemIcon(item, index),

            //信息
            _buildItemInfo(item, index),
          ];
        })
      ];
    });
  }

  Widget _buildItemInfo(YayunItemInfo item, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //标题
          Text(
            item.subItemList[index].title,
            style: TextStyle(fontSize: 15, color: Colors.redAccent),
          ),

          //子标题
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              item.subItemList[index].subTitle,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemIcon(YayunItemInfo item, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Image.network(item.subItemList[index].tag),
      ),
    );
  }

  Widget _buildItemRank(int index) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Text(
        '${index + 1}',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildItemBg(
    YayunItemInfo item, {
    required List<Widget> Function(int index) builder,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(item.subItemList.length, (index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () => onItem(item.subItemList[index]),
              child: Row(children: builder(index)),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return GestureDetector(
      onTap: () => onTitle(title),
      child: Row(children: [
        //标题名称
        Text(
          title,
          style: TextStyle(fontSize: 21),
        ),

        //图标
        Container(
          margin: EdgeInsets.only(left: 10),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 15,
          ),
        ),
      ]),
    );
  }

  Widget _buildBg({
    required List<Widget> Function(YayunItemInfo item) builder,
  }) {
    return Container(
      width: 800,
      margin: EdgeInsets.only(top: 38, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(data.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: builder(data[index]),
          );
        }),
      ),
    );
  }
}
