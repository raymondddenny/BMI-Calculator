import 'package:bmi_calculator/Model/constants.dart';
import 'package:bmi_calculator/UI/Screens/about_page.dart';
import 'package:bmi_calculator/UI/Widgets/bottom_btn.dart';
import 'package:bmi_calculator/UI/Widgets/reusable_card.dart';
import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIInfoPage extends StatelessWidget {
  static final String keyId = "bmiInfo_page";
  final String bmiResultNumber;
  final String bmiResultText;

  BMIInfoPage({@required this.bmiResultNumber, @required this.bmiResultText});
  @override
  Widget build(BuildContext context) {
    double _bmiNumber = double.parse(bmiResultNumber);
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
        title: Text("BMI INFO"),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BMI results
          Row(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: ReusableCard(
                  color: kDeactivateCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Your BMI",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: kTextBoldColor,
                          ),
                        ),
                        Text(
                          bmiResultNumber,
                          style: GoogleFonts.poppins(
                              fontSize: 48,
                              color: kTextBoldColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmiResultText,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: (_bmiNumber >= 25)
                                  ? Colors.red
                                  : (_bmiNumber >= 18.5)
                                      ? kActiveCardColor
                                      : Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // BMI Info
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ReusableCard(
                  color: kDeactivateCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "18.5 to 24.9",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Normal",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: kTextColorDeactivated,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Less than 18.5",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Underweight",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: kTextColorDeactivated,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "25 to 29.9",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Overweight",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: kTextColorDeactivated,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BottomBtn(
                  color: kActiveCardColor,
                  btnTitle: "Recalculated",
                  textColor: Colors.white,
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
