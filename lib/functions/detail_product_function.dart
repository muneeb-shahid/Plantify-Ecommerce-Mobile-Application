import 'package:flutter/material.dart';

import '../constants/color.dart';

class DetailPageFunction {
  static AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.appLightBlueColor,
      elevation: 0,
      leading: const InkWell(
        child: Image(
          image: AssetImage("assets/images/detailProduct logo.png"),
        ),
      ),
      title: Text(
        'PLANTIFY',
        style: TextStyle(
            fontFamily: 'Philosopher',
            letterSpacing: 4,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.appBlackColor),
      ),
      actions: [
        InkWell(
          onTap: (() {}),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        const InkWell(
          child: Image(
            image: AssetImage('assets/images/detailProduct filter.png'),
          ),
        ),
      ],
    );
  }
}
