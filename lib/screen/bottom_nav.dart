import 'package:flutter/material.dart';
import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentindex = 0;
  final screens = [
    const Center(
      child: HomeView(),
    ),
    const Center(
      child: Text("Favorite"),
    ),
    const Center(child: Text("Shopping")),
    const Center(child: Text("User")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: screens[currentindex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            showUnselectedLabels: false,
            currentIndex: currentindex,
            onTap: (index) => setState(() {
                  currentindex = index;
                }),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                ),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                label: "Shopping",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
                label: "User",
              ),
            ]));
  }
}
