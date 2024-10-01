import 'package:d_info/d_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_firebase_auth_app/page/sign_in_page.dart';
import 'package:learn_firebase_auth_app/page/success_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessRegisterPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          DInfo.toastError('Pengguna sudah ada');
        } else {
          DInfo.toastError('Terjadi kesalahan: ${e.message}');
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
                    child: Text('Buat Akun Baru', style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xff404040), fontSize: 24, fontWeight: FontWeight.w600
                        )
                    ),),
                  ),
                  SizedBox(height: 80,),
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
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                    color: Colors.red, width: 1
                                  )
                                  )
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
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                        color: Colors.red, width: 1
                                    )
                                    )
                                ),
                              )),
                          const SizedBox(height: 8,),
                          Text('Konfirmasi Kata Sandi', style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff404040), fontSize: 12, fontWeight: FontWeight.w600
                            ),
                          )),
                          const SizedBox(height: 8,),
                          Container(
                              width: 360, height: 40,
                              child: TextFormField(
                                obscureText: true,
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    DInfo.toastError('Kata sandi tidak boleh kosong');
                                    return 'Kata sandi tidak boleh kosong';
                                  }
                                  if (value != _passwordController.text) {
                                    DInfo.toastError('Kata sandi yang dimasukkan berbeda');
                                    return 'Kata sandi yang dimasukkan berbeda';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Konfirmasikan kata sandi di sini',
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
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8), borderSide: BorderSide(
                                        color: Colors.red, width: 1
                                    )
                                    )
                                ),
                              )),
                          const SizedBox(height: 49,),
                          SizedBox(
                            height: 55, width: 360,
                            child: ElevatedButton(
                                onPressed: (){
                                  register();
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color(0xff439BE8)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)
                                        )
                                    )
                                ),
                                child: Text('Buat Akun', style: GoogleFonts.poppins(
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
                                Text('Sudah punya akun?', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12, color: Color(0xff404040), fontWeight: FontWeight.normal
                                    )
                                ),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                                  },
                                  child: Text('Masuk', style: GoogleFonts.poppins(
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
