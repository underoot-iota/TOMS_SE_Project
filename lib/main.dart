import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:toms_se_project/admin_home_page.dart';
import 'package:toms_se_project/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toms_se_project/profile.dart';
import 'package:toms_se_project/register.dart';
import 'package:toms_se_project/set_values.dart';
import 'admin_home.dart';
import 'login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: login(),
    );
  }
}
