import 'package:flutter/material.dart';
import 'package:flutter_website/app.dart';
import 'package:flutter_website/loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 企业站',
      theme: mDefaultTheme,
      routes: <String, WidgetBuilder>{
        // 静态路由
        "app":(BuildContext context) => const App(),
        "company_info": (BuildContext context) => WebviewScaffold(
              url: 'https://www.google.com/',
              appBar: AppBar(
                title: const Text("公司介绍"),
                leading: IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      // 路由跳转
                      Navigator.of(context).pushReplacementNamed("app");
                    }),
              ),
            ),
      },
      // home: const MyHomePage(title: 'Flutter 企业站'),
      home: const LoadingPage(),
    );
  }
}

// 自定义主题
final ThemeData mDefaultTheme = ThemeData(
  primarySwatch: Colors.red,
);