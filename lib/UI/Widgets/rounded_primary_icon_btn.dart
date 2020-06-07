import 'package:bmi_calculator/Model/constants.dart';
import 'package:flutter/material.dart';

class RoundedPrimaryIconButton extends StatelessWidget {
  final Widget childIcon;
  RoundedPrimaryIconButton({@required this.childIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            color: kDeactivateCardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[350],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1.0)
            ]),
        child: childIcon,
      ),
    );
  }
}
