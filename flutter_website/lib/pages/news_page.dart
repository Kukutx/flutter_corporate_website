import 'package:flutter/material.dart';
import 'package:flutter_website/model/news.dart';
import 'package:flutter_website/pages/news_detail_page.dart';
import 'package:flutter_website/services/news.dart';

// 新闻页
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModal listData = NewsListModal([]);

  // 获取新闻列表数据
  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 带分隔线的List
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        // 分隔线构造器
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 3.0,
          color: Colors.grey,
        ), // 分隔线
        itemCount: listData.data.length,
        // 列表项构建器
        itemBuilder: (BuildContext context, int index) {
          // 新闻列表项
          NewsItemModal item = listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: const Icon(Icons.fiber_new),
            trailing: const Icon(Icons.arrow_forward),
            contentPadding: const EdgeInsets.all(10.0),
            enabled: true,
            onTap: () {   // 跳转详情页
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetail(item: item)) // 动态路由
                  );
            },
          );
        },
      ),
    );
  }
}
