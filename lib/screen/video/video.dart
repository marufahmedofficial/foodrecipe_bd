import 'dart:html';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  static const String path = "YoutubeScreen";

  const YoutubeScreen({super.key});
  @override
  YoutubeScreenState createState() => YoutubeScreenState();
}

class YoutubeScreenState extends State<YoutubeScreen> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),


      );
  }


  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(data["title"]),
      ),
      body:  WebViewWidget(
        controller: controller,
      ),
    );
  }
}