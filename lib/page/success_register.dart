import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_auth_app/page/sign_in_page.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 221,),
              Center(child: Image.asset('images/success.jpg')),
              SizedBox(height: 20,),
              Text('Akun Berhasil Dibuat!', style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff404040)
                )
              ),),
              SizedBox(height: 8,),
              Text('Silakan menuju halaman \nLogin untuk dapat menggunakan layanan di AyoSehat', style: GoogleFonts.poppins(textStyle: TextStyle(
                color: Color(0xff404040), fontSize: 14, fontWeight: FontWeight.normal,
              )), textAlign: TextAlign.center,),
              SizedBox(height: 50,),
              SizedBox(
                height: 55, width: 315,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
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
            ],
          )
      ),
    );
  }
}
