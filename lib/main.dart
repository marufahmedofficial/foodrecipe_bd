import 'package:flutter/material.dart';
import 'screen/about_us/about_us.dart';
import 'screen/cooked.dart';
import 'screen/details/detail.dart';
import 'screen/favorite.dart';
import 'screen/home/home.dart';
import 'screen/tips/tips.dart';
import 'screen/video/video.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe BD',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: HomeScreen.path,
      routes: {
        HomeScreen.path: (ctx) => const HomeScreen(),
        DetailScreen.path: (ctx) => DetailScreen(),
        YoutubeScreen.path: (ctx) => const YoutubeScreen(),
        Favorite.path: (ctx) => const Favorite(),
        AboutUs.path: (ctx) => const AboutUs(),
        CookingTips.path: (ctx) => const CookingTips(),
        Cooked.path: (ctx) => const Cooked(),
      },
    );
  }
}
