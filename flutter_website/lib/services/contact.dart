import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_website/conf/configure.dart';
import 'package:http/http.dart' as http;

// 获取留言数据
getContactResult(String msg) async {
  // ignore: prefer_interpolation_to_compose_strings
  String url = "http://" +
      Config.IP +
      ":" +
      Config.PORT +
      '/?action=contactCompany&msg=$msg';
  var res = await http.get(Uri.parse(url));
  var info = res.body.toString();
  debugPrint(info);
  return info;
}
