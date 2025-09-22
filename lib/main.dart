import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_for_test/home.dart';
import 'package:just_for_test/nav_bar_screen.dart';
import 'package:just_for_test/product_detail.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blueGrey, // Status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
      //home: const TestPage(),
    );
  }
}