import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackthon_application/screen/bottomNav.dart';
import 'package:hackthon_application/screen/detailproduct.dart';
import 'package:hackthon_application/screen/drawer.dart';
import 'package:hackthon_application/screen/home.dart';
import 'package:hackthon_application/screen/login.dart';
import 'package:hackthon_application/screen/order.dart';
import 'package:hackthon_application/screen/sawal.dart';
import 'package:hackthon_application/screen/signup.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sawal(),
    );
  }
}
