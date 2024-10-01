import 'package:d_info/d_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_auth_app/page/home_page.dart';
import 'package:learn_firebase_auth_app/page/register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DInfo.toastError('Pengguna tidak ditemukan');
        } else if (e.code == 'wrong-password') {
          DInfo.toastError('Kata sandi salah');
        } else {
          DInfo.toastError('Login gagal ${e.message}');
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom + 16),
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 36,),
                  Center(
                    child: Text('Selamat Datang Kembali!', style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xff404040), fontSize: 24, fontWeight: FontWeight.w600
                      )
                    ),),
                  ),
                  SizedBox(height: 120,),
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email', style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xff404040), fontSize: 12, fontWeight: FontWeight.w600
                            ),
                          )),
                          const SizedBox(height: 8,),
                          Container(
                            width: 360, height: 40,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  DInfo.toastError('Email tidak boleh kosong!');
                                  return 'Email tidak boleh kosong!';
                                }
                                if (!value!.contains('@')) {
                                  DInfo.toastError('Masukkan email yang sesuai');
                                  return 'Masukkan email yang sesuai';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Masukkan email di sini',
                                contentPadding: const EdgeInsets.only(left: 10, top: 6, bottom: 10),
                                hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal
                                  )
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                  color: Colors.grey, width: 1
                                )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                    color: Color(0xff439BE8), width: 1
                                )
                              ),
                            ),
                          )),
                          const SizedBox(height: 12,),
                          Text('Kata Sandi', style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff404040), fontSize: 12, fontWeight: FontWeight.w600
                            ),
                          )),
                          const SizedBox(height: 8,),
                          Container(
                              width: 360, height: 40,
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    DInfo.toastError('Kata sandi tidak boleh kosong');
                                    return 'Kata sandi tidak boleh kosong';
                                  }
                                  if (value!.length < 8) {
                                    DInfo.toastError('Kata sandi minimal 8 karakter');
                                    return 'Kata sandi minimal 8 karakter';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Masukkan kata sandi di sini',
                                  contentPadding: const EdgeInsets.only(left: 10, top: 6, bottom: 10),
                                  hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal
                                      )
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                      color: Colors.grey, width: 1
                                  )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                      color: Color(0xff439BE8), width: 1
                                  )
                                  ),
                                ),
                              )),
                          const SizedBox(height: 4,),
                          Padding(
                            padding: const EdgeInsets.only(left: 249),
                            child: Text('Lupa Kata Sandi?', style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff439BE8), fontSize: 12, fontWeight: FontWeight.normal
                              )
                            ),),
                          ),
                          const SizedBox(height: 49,),
                          SizedBox(
                            height: 55, width: 360,
                            child: ElevatedButton(
                                onPressed: (){
                                  login();
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
                          const SizedBox(height: 8,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Belum punya akun?', style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12, color: Color(0xff404040), fontWeight: FontWeight.normal
                                  )
                                ),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                                  },
                                  child: Text('Buat Akun', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12, color: Color(0xff439BE8), fontWeight: FontWeight.normal
                                      )
                                  ),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      )
    );
  }
}
