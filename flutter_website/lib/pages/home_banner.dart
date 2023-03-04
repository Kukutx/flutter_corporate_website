import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';                    // 虽然不知道什么原因会让轮播图组件报错，但是运行的时候要加 --no-sound-null-safety 参数

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});
  // 轮播路径
  List<String> banners = <String>[
    "assets/images/banners/1.jpg",
    "assets/images/banners/2.jpg",
    "assets/images/banners/3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // 计算高宽，按比例
    double width = MediaQuery.of(context).size.width;
    double height = width * 540 / 1080.0;
    return Container(
      width: width,
      height: height,
      //轮播组件
      child: Swiper(
        itemBuilder: (BuildContext context, index) {
          return Container(
            // 图片左右内边距
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,        // 轮播数量
        scrollDirection: Axis.horizontal, // 横向
        autoplay: true,                   // 是否自动播放
      ),
    );
  }
}
