import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_auth_app/page/register_page.dart';
import 'package:learn_firebase_auth_app/page/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 145,),
              Row(
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
              SizedBox(height: 181,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Selamat Datang!', style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 24, color: Color(0xff404040), fontWeight: FontWeight.w600
                  )),),
                  SizedBox(height: 57,),
                  SizedBox(
                    height: 55, width: 360,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xff439BE8)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          )
                        ),
                        child: Text('Masuk', style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600
                          )
                        ),)),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 55, width: 360,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Color(0xff439BE8),
                                width: 1
                              )
                            ),
                            backgroundColor: MaterialStateProperty.all(Color(0xffFFFFFF)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                )
                            )
                        ),
                        child: Text('Buat Akun', style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18, color: Color(0Xff439BE8), fontWeight: FontWeight.w600
                            )
                        ),)),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
