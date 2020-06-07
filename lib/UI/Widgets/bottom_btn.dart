import 'package:bmi_calculator/Model/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBtn extends StatelessWidget {
  final Function onPress;
  final String btnTitle;
  final Color color;
  final Color textColor;

  BottomBtn({this.btnTitle, this.onPress, this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: kDeactivateCardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200],
                offset: Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1.0)
          ]),
      width: MediaQuery.of(context).size.width / 0.25,
      child: RaisedButton(
        onPressed: onPress,
        color: color,
        child: Text(
          btnTitle,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 18,
          ),
        ),
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
