import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyInsta extends StatefulWidget {
  @override
  _MyInstaState createState() => _MyInstaState();
}

class _MyInstaState extends State<MyInsta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RoundedPrimaryIconButton(
          childIcon: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        title: Text("Developer contact"),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://www.instagram.com/dennyraymond/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
