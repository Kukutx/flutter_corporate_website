import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_website/conf/configure.dart';
import 'package:http/http.dart' as http;

// 获取新闻数据
getNewsResult() async {
  // ignore: prefer_interpolation_to_compose_strings
  String url = "http://" +
      Config.IP +
      ":" +
      Config.PORT +
      '/?action=getNews';
  var res = await http.get(Uri.parse(url));
  String body = res.body;
  var json = jsonDecode(body);
  debugPrint(json.toString());

  return json["items"] as List;
}
