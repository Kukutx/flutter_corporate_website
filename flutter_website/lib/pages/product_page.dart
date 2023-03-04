import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/product_list_page.dart';
import 'package:flutter_website/services/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  ProductListModal listData = ProductListModal([]);
  int page = 0;
  // 获取产品列表数据 同时回调使用
  void getProductList() async {

    var data = await getProductResult(page++);
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
    return ProductResultListWidget(list : listData,getNextPage: () => getProductList(),);  // 获取并加载产品数据列表
  }
}
