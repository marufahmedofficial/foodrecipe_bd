import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: HomeScreen.path,
      routes: {
        // HomeScreen.path: (ctx) => HomeScreen(),
        // DetailScreen.path: (ctx) => DetailScreen(),
        // YoutubeScreen.path: (ctx) => YoutubeScreen(),
        // Favorite.path: (ctx) => Favorite(),
        // AboutUs.path: (ctx) => AboutUs(),
        // CookingTips.path: (ctx) => CookingTips(),
        // Cooked.path: (ctx) => Cooked(),
      },
    );
  }
}
