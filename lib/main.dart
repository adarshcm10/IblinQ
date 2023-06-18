import 'package:IblinQ/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

import 'var.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!await FlutterOverlayWindow.isPermissionGranted()) {
    FlutterOverlayWindow.requestPermission();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IblinQ',
      home: MyHomePage(),
    );
  }
}

@pragma("vm:entry-point")
void overlayMain() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: const imagepath(),
      )));
}

class imagepath extends StatefulWidget {
  const imagepath({super.key});

  @override
  State<imagepath> createState() => _imagepathState();
}

class _imagepathState extends State<imagepath> {
  int indx = ShareData.Indx;
  String imgsel() {
    if (indx == 0) {
      return 'assets/2.gif';
    } else if (indx == 1) {
      return 'assets/3.gif';
    } else if (indx == 2) {
      return 'assets/4.gif';
    } else if (indx == 3) {
      return 'assets/logo.png';
    }
    return 'assets/2.gif';
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(imgsel());
  }
}
