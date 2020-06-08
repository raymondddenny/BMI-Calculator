import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DesignInspiration extends StatefulWidget {
  @override
  _DesignInspirationState createState() => _DesignInspirationState();
}

class _DesignInspirationState extends State<DesignInspiration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Text("Design Inspiration"),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl:
              'https://dribbble.com/shots/11368106-BMI-Calculator-App-Neumorphism',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
