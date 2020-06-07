import 'package:bmi_calculator/Model/constants.dart';
import 'package:bmi_calculator/UI/Screens/details_page.dart';
import 'package:bmi_calculator/UI/Widgets/bottom_btn.dart';
import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'about_page.dart';

class ResultPage extends StatelessWidget {
  static final String keyId = "result_page";
  final String bmiResultNumber;
  final String bmiResultText;
  final String bmiResultTextInterpratation;

  ResultPage(
      {this.bmiResultNumber,
      this.bmiResultText,
      this.bmiResultTextInterpratation});
  @override
  Widget build(BuildContext context) {
    // to solve error when pass 25
    double result = double.parse(bmiResultNumber) * 3;
    result = result / 100;

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
        title: Text("BMI RESULTS"),
        centerTitle: true,
        actions: [
          RoundedPrimaryIconButton(
            childIcon: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );
                }),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bmiResultText.toUpperCase(),
            style: GoogleFonts.poppins(
                color: (bmiResultText == 'Overweight ')
                    ? Colors.red
                    : (bmiResultText == 'Underweight ')
                        ? Colors.orange
                        : kActiveCardColor,
                fontSize: 28,
                fontWeight: FontWeight.w900),
          ),
          Center(
            child: Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                  color: kDeactivateCardColor,
                  borderRadius: BorderRadius.circular(250),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 8.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1.0)
                  ]),
              child: CircularPercentIndicator(
                radius: 280.0,
                lineWidth: 20.0,
                percent: result,
                animation: true,
                animationDuration: 2500,
                center: new Text(
                  bmiResultNumber,
                  style: kNumberTextStyle.copyWith(
                      color: kTextColorDeactivated, fontSize: 70),
                ),
                backgroundColor: kTextColorDeactivated,
                progressColor: (result >= 0.8)
                    ? Colors.red
                    : (result >= 0.6) ? kActiveCardColor : Colors.orange,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
          ),
          Text(
            bmiResultTextInterpratation,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: BottomBtn(
                  color: kDeactivateCardColor,
                  btnTitle: "Details",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMIInfoPage(
                                  bmiResultNumber: bmiResultNumber,
                                  bmiResultText: bmiResultText,
                                )));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
