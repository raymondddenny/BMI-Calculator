import 'package:bmi_calculator/Model/constants.dart';
import 'package:bmi_calculator/UI/Screens/web_view_design.dart';
import 'package:bmi_calculator/UI/Widgets/reusable_card.dart';
import 'package:bmi_calculator/UI/Widgets/rounded_primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static final String keyId = "bmiInfo_page";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          title: Text("ABOUT APP"),
          centerTitle: true,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "BMI Calculator App",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              color: kTextBoldColor,
                            ),
                          ),
                          Text(
                            "Version 1.0",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: kTextBoldColor,
                            ),
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                                "Design Inspiration =>",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DesignInspiration(),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Tap here",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: kTextColorActivated,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: kActiveCardColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[500],
                                            offset: Offset(4.0, 4.0),
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-4, -4),
                                            blurRadius: 15,
                                            spreadRadius: 1.0)
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Developer =>",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: kDeactivateCardColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[500],
                                              offset: Offset(4.0, 4.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 1.0),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-4, -4),
                                              blurRadius: 15,
                                              spreadRadius: 1.0)
                                        ]),
                                    child: IconButton(
                                        icon: Icon(FontAwesomeIcons.instagram),
                                        onPressed: _launchURL),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: kDeactivateCardColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[350],
                                              offset: Offset(4.0, 4.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 1.0),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-4, -4),
                                              blurRadius: 15,
                                              spreadRadius: 1.0)
                                        ]),
                                    child: IconButton(
                                        icon: Icon(FontAwesomeIcons.linkedinIn),
                                        onPressed: _launchURLLinkedin),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: kDeactivateCardColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[500],
                                              offset: Offset(4.0, 4.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 1.0),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-4, -4),
                                              blurRadius: 15,
                                              spreadRadius: 1.0)
                                        ]),
                                    child: IconButton(
                                        icon: Icon(FontAwesomeIcons.github),
                                        onPressed: _launchURLGithub),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.instagram.com/dennyraymond/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLLinkedin() async {
  const url = 'https://www.linkedin.com/in/denny-raymond-rettob-16636b196/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLGithub() async {
  const url = 'https://github.com/raymondddenny';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
