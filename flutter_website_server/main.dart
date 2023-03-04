import 'dart:convert';
import 'dart:io';
import 'data.dart';

void main() async {
  // 异步处理
  var requestServer = await HttpServer.bind('192.168.28.245', 8080);
  print('http服务启动起来');
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

// 处理请求
void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      handleGET(request);
    }
  } catch (e) {
    print("捕获了一个异常：$e");
  }
}

// 处理get
void handleGET(HttpRequest request) {
  //获取请求参数
  var action = request.uri.queryParameters['action'];
  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];
    print("第$page页数据:" + json.encode(products));
    print("获取产品数据...");
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close(); // .. 是 dart 的语法糖表示这可以不断去处理
  }
  else if (action == 'getNews') {
    print("获取新闻数据...");
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(news))
      ..close(); // .. 是 dart 的语法糖表示这可以不断去处理
  }
  else if (action == 'contactCompany') {
    var msg = request.uri.queryParameters['msg'];
    print("客户留言为: $msg");
    request.response
      ..statusCode = HttpStatus.ok
      ..write("提交成功: $msg")
      ..close(); // .. 是 dart 的语法糖表示这可以不断去处理
  }
}

// 处理post
void handlePOST(HttpRequest request) {}

// abstract class HttpStatus {}
