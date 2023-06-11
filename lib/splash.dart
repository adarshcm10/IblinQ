import 'dart:async';

import 'package:IblinQ/home.dart';
import 'package:IblinQ/transitions.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
        () => Navigator.pushReplacement(context, FadeRoute(page: home())));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/splash.gif');
  }
}
