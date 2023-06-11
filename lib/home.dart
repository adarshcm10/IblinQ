// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'buttons.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedButtonIndex = -1;
  var img;

  void selectButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020202),
      appBar: AppBar(
        //increase appbar height
        toolbarHeight: 100,
        //background color 020202
        backgroundColor: const Color(0xff020202),
        //center title IblinQ
        centerTitle: true,
        //title IblinQ
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'IblinQ',
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 40,
                fontFamily: 'Moirai One'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableImageButton(
                    imagePath: 'assets/2.gif',
                    isSelected: selectedButtonIndex == 0,
                    onPressed: () {
                      selectButton(0);
                      img = 'assets/2.gif';
                    }),
                SelectableImageButton(
                    imagePath: 'assets/3.gif',
                    isSelected: selectedButtonIndex == 1,
                    onPressed: () {
                      selectButton(1);
                      img = 'assets/3.gif';
                    }),
                SelectableImageButton(
                  imagePath: 'assets/4.gif',
                  isSelected: selectedButtonIndex == 2,
                  onPressed: () {
                    selectButton(2);
                    img = 'assets/4.gif';
                  },
                ),
                SelectableImageButton(
                  imagePath: 'assets/5.gif',
                  isSelected: selectedButtonIndex == 3,
                  onPressed: () {
                    selectButton(3);
                    img = 'assets/5.gif';
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
