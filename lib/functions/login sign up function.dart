import 'package:flutter/material.dart';

import '../constants/color.dart';

class login_Signup_function {
  login_signup_constants(String heading, String paragraph) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(fontFamily: 'Philosopher',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.app_Green_Color,
                  letterSpacing: 1),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              paragraph,
              style: TextStyle(fontFamily: 'Poppins',
                  wordSpacing: 3,
                  color: AppColors.app_Green_Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
