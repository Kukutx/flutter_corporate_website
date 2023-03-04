import 'package:flutter/material.dart';
import 'package:flutter_website/services/contact.dart';

class AboutContactPage extends StatefulWidget {
  const AboutContactPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AboutContactPageState createState() => AboutContactPageState();
}

class AboutContactPageState extends State<AboutContactPage> {
  // 文本编辑控制器
  TextEditingController controller = TextEditingController();
  void commit() {
    if (controller.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("请输入内容"),
              ));
    } else {
      var info = getContactResult(controller.text);
      debugPrint(info.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("给我留言"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 380.0,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "请留言",
                  labelText: "请留言",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 220.0,
              height: 48.0,
              child: ElevatedButton(
                  child: Text(
                    "给我们留言",
                    style: TextStyle(fontSize: 16.0, backgroundColor: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    commit();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
