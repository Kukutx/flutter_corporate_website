import 'package:flutter/material.dart';
import 'package:flutter_website/pages/home_banner.dart';
import 'package:flutter_website/pages/home_product_page.dart';
import '../services/product.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ProductListModal listData = ProductListModal([]);
  void getProductList() async {
    var data = await getProductResult();
    ProductListModal list = ProductListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductPage(list: listData,)
        ],
      ),
    );
  }
}
