import 'package:flutter/material.dart';
import '../model/product.dart';

// 产品的详情页
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.item});
  final ProductItemModal item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(item.desc),
          ),
        ],
      ),
    );
  }
}
