// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              //borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //add image 1.gif
                Padding(
                  padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                  child: Image(
                    image: AssetImage('assets/1.gif'),
                    height: 80,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                  child: Image(
                    image: AssetImage('assets/2.gif'),
                    height: 80,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                  child: Image(
                    image: AssetImage('assets/1.gif'),
                    height: 80,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Image(
                    image: AssetImage('assets/1.gif'),
                    height: 80,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
