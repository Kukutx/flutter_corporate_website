import 'package:flutter/material.dart';
import 'package:flutter_website/model/news.dart';

// 产品的详情页
class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key, required this.item});
  final NewsItemModal item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(item.content),
      ),
    );
  }
}
