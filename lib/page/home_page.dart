import 'package:d_info/d_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_auth_app/page/welcome_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage()), (Route<dynamic> route) => false);
    } catch (e) {
      DInfo.toastError('Terjadi kesalahan: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image.asset('images/user.jpg'),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Halo,', style: GoogleFonts.poppins(textStyle: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff404040),
                        )),),
                        SizedBox(height: 2,),
                        Text(user!.email!, style: GoogleFonts.poppins(textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff404040)
                        )),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 55, width: 315,
                child: ElevatedButton(
                    onPressed: (){
                      logout(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xff439BE8)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        )
                    ),
                    child: Text('Keluar', style: GoogleFonts.poppins(
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
