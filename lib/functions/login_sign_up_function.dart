import 'package:flutter/material.dart';

import '../constants/color.dart';

class LoginSignupFunction {
  loginSignupConstants(String heading, String paragraph) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.appGreenColor,
                  letterSpacing: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              paragraph,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  wordSpacing: 3,
                  color: AppColors.appGreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
