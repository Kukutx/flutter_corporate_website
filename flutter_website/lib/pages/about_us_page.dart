import 'package:flutter/material.dart';
import 'about_contact_page.dart';


class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text("公司介绍"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("company_info");
              },
            ),
            const Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("公司优势"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("company_info");
              },
            ),
            const Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("联系我们"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const AboutContactPage())));
              },
            ),
            const Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: const Icon(Icons.abc_outlined),
              title: const Text("关于我们"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("company_info");
              },
            ),
            const Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
