import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/color.dart';
import '../functions/login sign up function.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
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
              color: AppColors.app_black_Color,
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
        //     ),)
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => LoginPage(),
        //     ),
        //     (route) => false);
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
          child: Image(
            image: AssetImage("assets/images/backward button.png"),
          ),
        ),
        backgroundColor: AppColors.app_grey_Color,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
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
                        color: AppColors.app_black_Color,
                        letterSpacing: 10),
                  ),
                ],
              ),
              login_Signup_function().login_signup_constants("Sign Up",
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
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.green,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.black),
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
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon:
                            Icon(Icons.lock_open_outlined, color: Colors.black),
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
                              color: AppColors.app_Green_Color,
                            ),
                            child: Center(
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
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required.';

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

  return null;
}



















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hackthon_application/functions/login%20sign%20up%20function.dart';
// import 'package:hackthon_application/functions/textfieldscreen_function.dart';
// import 'package:hackthon_application/screen/home.dart';
// import 'package:hackthon_application/screen/login.dart';

// import '../constants/color.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//    TextEditingController email_control = TextEditingController();
//   TextEditingController pass_control = TextEditingController();
//   bool loading = false;

//   final _formKey = GlobalKey<FormState>();
//   late String _email, _password;
//   bool _isObscured = true;

//   void _toggleObscure() {
//     setState(() {
//       _isObscured = !_isObscured;
//     });
//   }

//   void _register() async {

//      if (_formKey.currentState!.validate()) {
//        Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Login(),
//             ));
//       _formKey.currentState!.save();
//       try {
//         // final User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password) )
//         final User? user = (await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//                 email: email_control.text, password: pass_control.text)) as User?;
//         print(user);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.redAccent,
//             content: Text(
//               "Registered Successfully. Please Login..",
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//         );
//         user;
//         user!.sendEmailVerification();
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Login(),
//             ));
            
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'email-already-in-use') {
//           print("Account Already exists");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Account Already exists",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         }
//       }
//     }
//   }

//   // void dispose() {
//   //   super.dispose();
//   //   email.dispose();
//   //   password.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: (() {
//             Navigator.pop(context);
//           }),
//           child: Image(
//             image: AssetImage("assets/images/backward button.png"),
//           ),
//         ),
//         backgroundColor: AppColors.app_grey_Color,
//         elevation: 0,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/images/login screen logo.jpeg',
//                     height: MediaQuery.of(context).size.height * 0.08,
//                     width: MediaQuery.of(context).size.width * 0.08,
//                     fit: BoxFit.fitWidth,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.08,
//                   ),
//                   Text(
//                     "PLANTIFY",
//                     style: TextStyle(
//                         fontFamily: 'Philosopher',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.app_black_Color,
//                         letterSpacing: 10),
//                   ),
//                 ],
//               ),
//               login_Signup_function().login_signup_constants("Sign Up",
//                   "Masukan No. Handphone Anda dan tunggu\nkode autentik dikirimkan"),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   textField().textField_email_Function("Email",
//                     "Enter Your Email", Icon(Icons.person), email_control),
             
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                      textField().textField_password_Function(
//                     "Password", "Enter your Password", pass_control),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _register;
//                     },
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.06,
//                       width: MediaQuery.of(context).size.width * 0.90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: AppColors.app_Green_Color,
//                       ),
//                       child: Center(
//                           child: loading
//                               ? CircularProgressIndicator(color: Colors.white)
//                               : Text(
//                                   'Sign Up',
//                                   style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white),
//                                 )),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// String? validateEmail(String? formEmail) {
//   if (formEmail == null || formEmail.isEmpty)
//     return 'E-mail address is required.';

//   String pattern = r'\w+@\w+\.\w+';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

//   return null;
// }

// String? validatePassword(String? formPassword) {
//   if (formPassword == null || formPassword.isEmpty)
//     return 'Password is required.';

//   String pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(formPassword))
//     return '''
//       Password must be at least 8 characters,
//       include an uppercase letter, number and symbol.
//       ''';

//   return null;
// }
