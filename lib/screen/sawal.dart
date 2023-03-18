import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackthon_application/constants/color.dart';
import 'package:hackthon_application/screen/login.dart';

class Sawal extends StatefulWidget {
  const Sawal({super.key});

  @override
  State<Sawal> createState() => _SawalState();
}

class _SawalState extends State<Sawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width * 1,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/sawal green image.png',
                          height: MediaQuery.of(context).size.height * 0.60,
                          width: MediaQuery.of(context).size.width * 1,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.60,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.asset(
                        'assets/images/sawal Vector.png',
                        // height: MediaQuery.of(context).size.height * 0.50,
                        // width: MediaQuery.of(context).size.width * 1,
                        fit: BoxFit.cover,
                      )),
                    ),
                    Positioned(
                      bottom: 0.01,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Image.asset(
                          'assets/images/Logo.png',
                          height: MediaQuery.of(context).size.height * 0.50,
                          width: MediaQuery.of(context).size.width * 1,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      // top: 400,
                      bottom: 60,
                      child: Container(
                          child: Text(
                        "PLANTIFY",
                        style: TextStyle(fontFamily: 'Philosopher',
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: AppColors.app_white_Color,
                            letterSpacing: 10),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                      "GET READY\nBE HIGYENIC",
                      style: TextStyle(fontFamily: 'Philosopher',
                          wordSpacing: 7,
                          color: AppColors.app_Green_Color,
                          fontWeight: FontWeight.w700,
                          fontSize: 26),
                    ),
                ),
              
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30,right: 20),
              child: Text(
                "Jelajahi AiLearn untuk menambah kemampuanmu dalam mengoperasikan Adobe Illustrator",
                textAlign: TextAlign.justify,  style: TextStyle(fontFamily: 'Inter',
                    wordSpacing: 3,
                    color: AppColors.app_Green_Color,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
          ),
          Container(
            child: Padding(
             padding: const EdgeInsets.only(left: 20, top: 30,right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
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
                    'Get Started',
                    style: TextStyle(fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.app_white_Color),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
