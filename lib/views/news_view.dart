import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class NewsView extends StatelessWidget {
   NewsView({super.key, required this.url });
  final  String url;
  
  WebViewController controller = WebViewController()
  ..setBackgroundColor(const Color.fromARGB(255, 142, 129, 129));
   
  
  @override
  Widget build(BuildContext context) {
    controller.loadRequest(Uri.parse(url));
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }

}