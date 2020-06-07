import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  IconContent({this.icon, this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 28,
          color: color,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: GoogleFonts.muli(
              fontWeight: FontWeight.bold, fontSize: 18, color: color),
        )
      ],
    );
  }
}
