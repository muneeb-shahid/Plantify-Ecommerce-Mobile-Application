import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/color.dart';
import '../functions/login_sign_up_function.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isObscured = true;

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  textFeildName(String Username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Username,
          style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.appBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
        final User? user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password)) as User?;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully. Please Login..",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        user;
        user!.sendEmailVerification();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Image(
            image: AssetImage("assets/images/backward button.png"),
          ),
        ),
        backgroundColor: AppColors.appGreyColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/login screen logo.jpeg',
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.08,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Text(
                    "PLANTIFY",
                    style: TextStyle(
                        fontFamily: 'Philosopher',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.appBlackColor,
                        letterSpacing: 10),
                  ),
                ],
              ),
              LoginSignupFunction().loginSignupConstants("Sign Up",
                  "Masukan No. Handphone Anda dan tunggu\nkode autentik dikirimkan"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textFeildName('Username/ Email'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.green,
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black),
                          hintText: 'Email'),
                      validator: validateEmail,
                      onSaved: (input) => _email = input!,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    textFeildName('Password'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: const Icon(Icons.lock_open_outlined,
                            color: Colors.black),
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: _toggleObscure,
                          child: Icon(
                              _isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                      ),
                      obscureText: _isObscured,
                      validator: validatePassword,
                      onSaved: (input) => _password = input!,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _register();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.appGreenColor,
                            ),
                            child: const Center(
                                child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   height: 16.0,
                    // ),

                    // ElevatedButton(
                    // onPressed: _register,
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => LoginPage(),
                    //       ));
                    // }

                    //   child: Text('Sign Up'),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => LoginPage(),
                    //         ));
                    //   },
                    //   child: Text('go to login page'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  }

  return null;
}
















