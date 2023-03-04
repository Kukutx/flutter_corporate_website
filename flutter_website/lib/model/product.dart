import 'package:flutter/scheduler.dart';

// 产品列表项数据
class ProductItemModal {
  late String desc; // 产品描述
  late String type; // 产品类型
  late String name; // 产品名称
  late String imageUrl; // 产品图片路径
  late String point;   // 产品特点

  ProductItemModal(
      { // 构造函数
      required this.desc,
      required this.type,
      required this.name,
      required this.imageUrl,
      required this.point
      });
  factory ProductItemModal.fromJson(dynamic json) {
    // 工厂模式,用于自动化json初始化赋值
    return ProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'], 
      point: json['point'],
    );
  }
}

// 产品列表数据
class ProductListModal {
  List<ProductItemModal> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json) {
    return ProductListModal(
        json.map((i) => ProductItemModal.fromJson((i))).toList());
  }
}
