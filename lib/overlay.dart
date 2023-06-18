// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class imagepath extends StatefulWidget {
  const imagepath({super.key});

  @override
  State<imagepath> createState() => _imagepathState();
}

class _imagepathState extends State<imagepath> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/3.gif');
  }
}
