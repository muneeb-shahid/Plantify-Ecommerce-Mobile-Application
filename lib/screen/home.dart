import 'package:flutter/material.dart';
import 'package:hackthon_application/screen/drawer.dart';
import '../constants/color.dart';
import 'all_products.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppBar buildAppBar() {
    return AppBar(
      bottom: TabBar(
          indicator: const BoxDecoration(color: Colors.transparent),
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: const [
            Center(
                child: Text(
              "Top Pick",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),
            Center(
                child: Text(
              "Indoor",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),
            Center(
                child: Text(
              "Outdoor",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),
            Center(
                child: Text(
              "Seeds",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),
            Center(
                child: Text(
              "Planter",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),
          ],
          labelColor: AppColors.appGreenColor,
          indicatorColor: AppColors.appGreenColor,
          automaticIndicatorColorAdjustment: false,
          labelPadding: const EdgeInsets.symmetric(horizontal: 20)),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: (() {}),
        child: const Image(
          image: AssetImage("assets/images/login screen logo.jpeg"),
        ),
      ),
      title: Text(
        'PLANTIFY',
        style: TextStyle(
            fontFamily: 'Philosopher',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.appBlackColor,
            letterSpacing: 4),
      ),
      actions: [
        InkWell(
          onTap: (() {}),
          child: const Image(
            image: AssetImage("assets/images/bell.png"),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DrawerScreen(),
                ));
          },
          child: const Image(
            image: AssetImage("assets/images/filter.jpeg"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            TopPick(),
            TopPick(),
            TopPick(),
            TopPick(),
            TopPick(),
          ],
        ),
      ),
    );
  }
}
