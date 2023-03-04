import 'package:flutter/scheduler.dart';

// 新闻列表项数据
class NewsItemModal {
  late String author;     // 作者
  late String title;      // 新闻标题
  late String content;    // 内容

  NewsItemModal(
      { // 构造函数
      required this.author,
      required this.title,
      required this.content,
      });
  factory NewsItemModal.fromJson(dynamic json) {
    // 工厂模式,用于自动化json初始化赋值
    return NewsItemModal(
      author: json['author'],
      title: json['title'],
      content: json['content'],
    );
  }
}

// 新闻列表数据
class NewsListModal {
  List<NewsItemModal> data;
  NewsListModal(this.data);

  factory NewsListModal.fromJson(List json) {
    return NewsListModal(
        json.map((i) => NewsItemModal.fromJson((i))).toList());
  }
}
