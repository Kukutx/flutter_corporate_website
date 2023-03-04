import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/product_detail_page.dart';
import 'package:flutter_website/style/index.dart';

// 产品返回列表数据
class ProductResultListWidget extends StatelessWidget {
  const ProductResultListWidget(
      {super.key, required this.list, required this.getNextPage});
  final ProductListModal list; // 列表数据
  final VoidCallback getNextPage; // 获取下一页

  @override
  Widget build(BuildContext context) {
    return list.data.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: list.data.length, // 列表项数
            itemBuilder: (BuildContext context, int i) {
              // 列表项构建
              ProductItemModal item = list.data[i]; // 列表项数据
              // 加载一页
              if ((i + 4) == list.data.length) {
                // 每次滚动轮锁到最后的点的时候就静态加载数据，到点就重新加载数据，这样可让产品页一直下滑
                getNextPage();
              }
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(item: item)) // 动态路由
                      );
                }),
                // 列表项背景
                child: Container(
                  color: ProductColors.bgColor,
                  padding: const EdgeInsets.only(top: 5.0, right: 5.0),
                  child: Row(
                    children: <Widget>[
                      // 产品页的图片
                      Image.asset(
                        item.imageUrl,
                        width: 120.0,
                        height: 120.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          // 防止溢出
                          child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 1,
                          color: ProductColors.divideLineColor,
                        ))),
                        // 产品信息垂直布局
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 5,
                                ),
                                // 产品类型
                                Text(
                                  item.type,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: ProductColors.typeColor,
                                  ),
                                ),
                                // 产品特点
                                item.point == null
                                    ? const SizedBox()
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        margin: const EdgeInsets.only(left: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    ProductColors.pointColor)),
                                        child: Text(
                                          item.point,
                                          style: const TextStyle(
                                            color: ProductColors.pointColor,
                                          ),
                                        ),
                                      )
                              ],
                            ),
                            Text(
                              item.name,
                              style: ProductFonts.itemNameStype,
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              );
            });
  }
}
