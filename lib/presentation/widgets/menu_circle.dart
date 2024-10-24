import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCircle extends StatelessWidget {
  final Color beginClr;
  final Color endClr;
  final Color shadowClr;
  final IconData icon;
  final String txtMenu;
  const MenuCircle(
      {super.key,
      required this.beginClr,
      required this.endClr,
      required this.shadowClr,
      required this.icon,
      required this.txtMenu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  // Color(0xFFFFE88C),
                  // Color(0xFFFFCC00),
                  beginClr,
                  endClr,
                ],
              ),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  // color: Color(0xFFFFCC00),
                  color: shadowClr,
                  blurRadius: 8,
                  offset: const Offset(3, 0),
                  spreadRadius: 1,
                )
              ]),
          child: Icon(
            // Icons.person_2_rounded,
            icon,
            color: Colors.white,
            size: 45,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          txtMenu,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1C1C1C),
          ),
        ),
      ],
    );
  }
}
