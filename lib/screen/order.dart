import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackthon_application/constants/color.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Image(
              image: AssetImage("assets/images/backward button.png"),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/Ellipse 25.png')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "  Order\nReceived ",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 36,
                  color: AppColors.app_Green_Color),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Order ID : #293092309",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.app_black_Color),
            ),
            Image.asset(
              'assets/images/order_Logo.png',
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fitWidth,
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.app_Green_Color,
                ),
                child: Center(
                    child: Text(
                  'KIRIM',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
