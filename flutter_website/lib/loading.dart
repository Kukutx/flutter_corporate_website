import 'package:flutter/material.dart';
import 'dart:async';
// 启动页
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    // 初始化有状态组件
    super.initState();
    // 加载页面时 停顿 3 秒
    Future.delayed(const Duration(seconds: 3), () {           // n 秒过后自动跳转该路由
      debugPrint("Flutter企业站启动...");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(       // 这个用于写PageView比较方便
        children: <Widget>[
          // 加载背景图
          Image.asset("assets/images/loading.jpg"),
          const Center(
            child: Text(
              "Flutter企业站",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
