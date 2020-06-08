import 'package:bmi_calculator/Model/constants.dart';
import 'package:bmi_calculator/UI/Screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InputPage(),
        // initialRoute: InputPage.keyId,
        routes: {
          InputPage.keyId: (context) => InputPage(),
          // ResultPage.keyId: (context) => ResultPage(),
          // BMIInfoPage.keyId: (context) => BMIInfoPage(),
        },
        theme: ThemeData(
            accentColor: kTextColorDeactivated,
            primaryIconTheme: IconThemeData(
              color: kTextColorDeactivated,
            ),
            primaryColor: kDeactivateCardColor,
            scaffoldBackgroundColor: kDeactivateCardColor,
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline6: GoogleFonts.muli(
                      fontSize: 18,
                      color: kTextColorDeactivated,
                      fontWeight: FontWeight.w900)),
            )),
      ),
    );
  }
}
