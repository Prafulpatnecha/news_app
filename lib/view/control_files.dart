import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home/home_page.dart';

import 'news_show_screen/view_news.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => const HomePage()),
        GetPage(name: "/view", page: () => const ViewNews()),
      ],
    );
  }
}
