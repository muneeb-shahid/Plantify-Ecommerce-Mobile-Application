import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackthon_application/constants/color.dart';
import 'package:hackthon_application/constants/color.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    super.key,
  });
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appGreenColor,
        ),
        drawer: Drawer(
          backgroundColor: AppColors.appGreenColor,
          child: ListView(
            padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
            children: [
              ListTile(
                leading: const Image(
                    image: AssetImage('assets/images/drawer shop icon.png')),
                title: const Center(
                    child: Text(
                  'Shop',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Image(
                    image: AssetImage('assets/images/DRAWER PLANT CARE.png')),
                title: const Center(
                    child: Text(
                  'Plant Care',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Image(
                    image: AssetImage('assets/images/drawer community.png')),
                title: const Center(
                    child: Text(
                  'Community',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Image(
                    image: AssetImage('assets/images/drawer account.png')),
                title: const Center(
                    child: Text(
                  'My Account',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Image(
                    image: AssetImage('assets/images/drawer truck.png')),
                title: const Center(
                    child: Text(
                  'Track Order',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const ListTile(
                title: Center(
                    child: Text(
                  'Get the dirt',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide:
                        BorderSide(width: 2, color: AppColors.appWhiteColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: BorderSide(
                      width: 2,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: TextStyle(color: AppColors.appWhiteColor),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Center(
                child: Text(
                  'FAQ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Center(
                child: Text(
                  'About US',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Center(
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
        body: Container(
          color: AppColors.appGreenColor,
        ));
  }
}
