import 'package:flutter/material.dart';
import 'package:flutter_website/pages/about_us_page.dart';
import 'package:flutter_website/pages/home_page.dart';
import 'package:flutter_website/pages/news_page.dart';
import 'package:flutter_website/pages/product_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // 当前选择页面索引
  var _currentIndex = 0;
  late HomePage homePage = const HomePage();
  late ProductPage productPage = const ProductPage();
  late NewsPage newsPage = const NewsPage();
  late AboutUsPage aboutUsPage = const AboutUsPage();

  currentPage(){
    switch (_currentIndex) {
      case 0:
        return homePage;
      case 1:
        return productPage;
      case 2:
        return newsPage;
      case 3:
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter企业站"),
        leading: const Icon(Icons.home),
        actions: <Widget>[
          // 右侧内边距
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: currentPage(),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 通过fixedColor设置选中item的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: const [          // 底部导航栏
          BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "产品", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "新闻", icon: Icon(Icons.fiber_new)),
          BottomNavigationBarItem(label: "关于", icon: Icon(Icons.insert_comment)),
        ],
      ),
    );
  }
}
