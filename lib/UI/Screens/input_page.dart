import 'package:bmi_calculator/Model/constants.dart';
import 'package:bmi_calculator/UI/Screens/about_page.dart';
import 'package:bmi_calculator/UI/Widgets/bottom_btn.dart';
import 'package:bmi_calculator/UI/Widgets/icon_data.dart';
import 'package:bmi_calculator/UI/Widgets/reusable_card.dart';
import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'package:bmi_calculator/Controller/calculated_bmi.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  static final String keyId = "main_page";
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;

// TODO : Passing arguments to navigator
  // final inputPage = ModalRoute.of(context).settings.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: GoogleFonts.muli(
              color: kTextColorDeactivated, fontWeight: FontWeight.w900),
        ),
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
      body: Container(
        margin: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ReusableCard(
                  tap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kDeactivateCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "Male",
                    color: selectedGender == Gender.male
                        ? kTextColorActivated
                        : kTextColorDeactivated,
                  ),
                ),
                ReusableCard(
                    tap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kDeactivateCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "Female",
                      color: selectedGender == Gender.female
                          ? kTextColorActivated
                          : kTextColorDeactivated,
                    ))
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ReusableCard(
                          color: kDeactivateCardColor,
                          cardChild: Column(
                            children: [
                              Text(
                                "Height",
                                style: GoogleFonts.muli(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kTextColorDeactivated),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                            activeTrackColor: kActiveCardColor,
                                            inactiveTrackColor:
                                                kTextColorDeactivated,
                                            thumbColor: Colors.white,
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 10.0),
                                            overlayShape:
                                                RoundSliderOverlayShape(
                                                    overlayRadius: 20.0),
                                            overlayColor: kOverlayColor),
                                        child: Slider(
                                          value: height.toDouble(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              height = newValue.round();
                                            });
                                          },
                                          min: 120,
                                          max: 220,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 370,
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/ruler1.png"),
                                        fit: BoxFit.fitHeight,
                                        color: kTextColorDeactivated,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          height.toString(),
                                          style: GoogleFonts.muli(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32,
                                              color: kTextBoldColor),
                                        ),
                                        Text('cm', style: kTextLabelStyle)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ReusableCard(
                          color: kDeactivateCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: GoogleFonts.muli(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kTextColorDeactivated),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: GoogleFonts.muli(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 48,
                                        color: kTextBoldColor),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedIconButton(
                                    childIcon: Icon(
                                      FontAwesomeIcons.plus,
                                      color: kTextColorDeactivated,
                                    ),
                                    color: kDeactivateCardColor,
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundedIconButton(
                                    childIcon: Icon(
                                      FontAwesomeIcons.minus,
                                      color: kTextColorDeactivated,
                                    ),
                                    color: kDeactivateCardColor,
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          color: kDeactivateCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: GoogleFonts.muli(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kTextColorDeactivated),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    age.toString(),
                                    style: GoogleFonts.muli(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 48,
                                        color: kTextBoldColor),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedIconButton(
                                    childIcon: Icon(
                                      FontAwesomeIcons.plus,
                                      color: kTextColorDeactivated,
                                    ),
                                    color: kDeactivateCardColor,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundedIconButton(
                                    childIcon: Icon(
                                      FontAwesomeIcons.minus,
                                      color: kTextColorDeactivated,
                                    ),
                                    color: kDeactivateCardColor,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            BottomBtn(
              color: kActiveCardColor,
              btnTitle: "Let's begin",
              textColor: Colors.white,
              onPress: () {
                CalculatorBMI calcBMI =
                    CalculatorBMI(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResultNumber: calcBMI.calculateBMI(),
                              bmiResultText: calcBMI.getResult(),
                              bmiResultTextInterpratation:
                                  calcBMI.getResultInterpretation(),
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final Widget childIcon;
  final Function onPress;
  final Color color;
  RoundedIconButton(
      {@required this.childIcon, @required this.onPress, this.color});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: color,
      child: childIcon,
    );
  }
}
