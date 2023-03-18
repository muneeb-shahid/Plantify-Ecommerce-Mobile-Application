import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackthon_application/screen/signup.dart';

import '../constants/color.dart';
import '../functions/login sign up function.dart';
import 'bottomNav.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

 

  onPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        if (user != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNav(),
              )).then((value) {
            setState(() {
              loading = false;
            });
          }).onError((error, stackTrace) {
            setState(() {
              loading = false;
            });
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            loading = false;
          });
          print("No User Found for that Email");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "No User Found for that Email",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          setState(() {
            loading = false;
          });
          print("Wrong Password Provided by User");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Wrong Password Provided by User",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    }
  }

  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              
              // login_Signup_function().login_signup_constants("Login",
              //     "Masukan NISN dan password untuk\nmemulai belajar sekarang"),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.04,
              // ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: validateEmail,
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    textFeildName('Password'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      validator: validatePassword,
                      onChanged: (value) {
                        _password = value;
                      },
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
                        suffixIcon: GestureDetector(
                          onTap: _toggleObscure,
                          child: Icon(
                              _isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                        hintText: 'Password',
                      ),
                      obscureText: _isObscured,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Center(
                                child: Text(
                              'Forget password',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              onPressed();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.app_Green_Color,
                              ),
                              child: Center(
                                  child: loading
                                      ? CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'Login',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )),
                            ),
                          ),
                        ),
                      ],
                    ),
                 
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: AppColors.app_black_Color,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: AppColors.app_Green_Color,
                              fontWeight: FontWeight.bold),
                        ))
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




















// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hackthon_application/constants/color.dart';
// import 'package:hackthon_application/functions/textfieldscreen_function.dart';
// import 'package:hackthon_application/screen/home.dart';
// import 'package:hackthon_application/screen/signup.dart';

// import '../functions/login sign up function.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final formkey = GlobalKey<FormState>();


//   bool _isObscured = true;

//   void _toggleObscure() {
//     setState(() {
//       _isObscured = !_isObscured;
//     });
//   }

//   final _auth = FirebaseAuth.instance;
//   late String _email;
//   late String _password;
//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;

//   Login_Function() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         loading = true;
//       });
//       try {
//         final user = await _auth.signInWithEmailAndPassword(
//             email: email.text, password: password.text);

//         if (user != null) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Home(),
//               )).then((value) {
//             setState(() {
//               loading = false;
//             });
//           }).onError((error, stackTrace) {
//             setState(() {
//               loading = false;
//             });
//           });
//         }
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           setState(() {
//             loading = false;
//           });
//           print("No User Found for that Email");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "No User Found for that Email",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         } else if (e.code == 'wrong-password') {
//           setState(() {
//             loading = false;
//           });
//           print("Wrong Password Provided by User");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Wrong Password Provided by User",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     email.dispose();
//     password.dispose();
//   }

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
//               login_Signup_function().login_signup_constants("Login",
//                   "Masukan NISN dan password untuk\nmemulai belajar sekarang"),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   textField().textField_email_Function('Username/Email', 'Email',
//                     Icon(Icons.lock_open_outlined), email),
//                 textField().textField_password_Function(
//                     'password', ' Password', password),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           child: Center(
//                               child: Text(
//                             'Forget password',
//                             style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           )),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 30,
//                         ),
//                         child: GestureDetector(
//                           onTap: () {

//                             Login_Function();
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: MediaQuery.of(context).size.height * 0.06,
//                             width: MediaQuery.of(context).size.width * 0.90,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: AppColors.app_Green_Color,
//                             ),
//                             child: Center(
//                                 child: loading
//                                     ? CircularProgressIndicator(
//                                         color: Colors.white)
//                                     : Text(
//                                         'Login',
//                                         style: TextStyle(
//                                             fontFamily: 'Inter',
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.white),
//                                       )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               Text(
//                 "Don't have an account?",
//                 style: TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 16,
//                   color: AppColors.app_black_Color,
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Signup()));
//                   },
//                   child: Text(
//                     "Sign up",
//                     style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontSize: 16,
//                         color: AppColors.app_Green_Color,
//                         fontWeight: FontWeight.bold),
//                   ))
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
