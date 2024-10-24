import 'package:flutter/material.dart';
import 'package:flutter_tes_biiscrop/presentation/pages/homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      color: Color(0xFFF5F5F5),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
