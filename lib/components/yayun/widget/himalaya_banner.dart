import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yayun/const/function.dart';

class HimalayaBanner extends StatelessWidget {
  const HimalayaBanner({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  ///数据源
  final List<String> data;

  ///点击banner的监听
  final ParamSingleCallback<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 200,
      margin: EdgeInsets.only(top: 18),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(data[index], fit: BoxFit.cover),
            ),
          );
        },
        autoplay: true,
        itemCount: data.length,
        viewportFraction: 0.8,
        scale: 0.9,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}
