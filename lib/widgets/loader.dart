import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//this basic loader is used wherever a loading animation is needed
class Loader extends StatelessWidget {
  final Color? color;
  const Loader({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(color!),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Please wait while \nwe fetch data ',
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
