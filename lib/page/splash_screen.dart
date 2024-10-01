import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:learn_firebase_auth_app/page/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBE7FC),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ayo', style: GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 30, color: Color(0xff439BE8), fontWeight: FontWeight.w500
            )),),
            Text('Sehat', style: GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 30, color: Color(0xff5BCCCF), fontWeight: FontWeight.w700
            )),)
          ],
        ),
      ),
    );
  }
}
