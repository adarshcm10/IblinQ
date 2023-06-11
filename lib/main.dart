import 'package:IblinQ/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //add theme data
      theme: ThemeData(
        primaryColor: Color(0xff020202),
        scaffoldBackgroundColor: Color(0xff020202),
      ),
      debugShowCheckedModeBanner: false,
      title: 'IblinQ',
      home: MyHomePage(),
    );
  }
}
