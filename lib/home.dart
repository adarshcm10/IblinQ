// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:IblinQ/transitions.dart';
import 'package:IblinQ/valueselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

import 'buttons.dart';
import 'history.dart';
import 'var.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void selectButton(int index) {
    setState(() {
      ShareData.Indx = index;
    });
  }

  late Timer overlayTimer;
  String dt = '';
  String time1 = '';
  String time2 = '';
  void startOverlayTimer() {
    int duration = ShareData.value;
    overlayTimer = Timer.periodic(Duration(seconds: duration), (timer) async {
      await FlutterOverlayWindow.showOverlay(height: 200, width: 200);

      Future.delayed(Duration(seconds: 3), () async {
        await FlutterOverlayWindow.closeOverlay();
      });
    });
  }

  bool active = false;
  String _imagePath = 'assets/round1.gif';
  Future<void> _changeImage() async {
    setState(() {
      _imagePath = _imagePath == 'assets/round1.gif'
          ? 'assets/round2.gif'
          : 'assets/round1.gif';
      if (active) {
        overlayTimer.cancel();
        DateTime currentDate = DateTime.now();
        String formattedHour = '${currentDate.hour}:${currentDate.minute}';
        time2 = formattedHour;
        ShareData.history.add([dt, time1, time2]);
      } else {
        DateTime currentDate = DateTime.now();
        String formattedDate =
            '${currentDate.day}-${currentDate.month}-${currentDate.year}';
        String formattedHour = '${currentDate.hour}:${currentDate.minute}';
        dt = formattedDate;
        time1 = formattedHour;
        startOverlayTimer();
      }
    });
    active = !active;
    _changetxtImg();
  }

  String _txtImg = 'assets/start.png';
  void _changetxtImg() {
    setState(() {
      _txtImg = _txtImg == 'assets/start.png'
          ? 'assets/stop.png'
          : 'assets/start.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff020202),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 65,
                ),
                child: Image.asset(
                  'assets/logo.png',
                  width: 200,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Select Icon',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'medio'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableImageButton(
                        imagePath: 'assets/2.gif',
                        isSelected: ShareData.Indx == 0,
                        onPressed: () {
                          selectButton(0);
                          ShareData.Img = 'assets/2.gif';
                        }),
                    SelectableImageButton(
                        imagePath: 'assets/3.gif',
                        isSelected: ShareData.Indx == 1,
                        onPressed: () {
                          selectButton(1);
                          ShareData.Img = 'assets/3.gif';
                        }),
                    SelectableImageButton(
                      imagePath: 'assets/4.gif',
                      isSelected: ShareData.Indx == 2,
                      onPressed: () {
                        selectButton(2);
                        ShareData.Img = 'assets/4.gif';
                      },
                    ),
                    SelectableImageButton(
                      imagePath: 'assets/5.gif',
                      isSelected: ShareData.Indx == 3,
                      onPressed: () {
                        selectButton(3);
                        ShareData.Img = 'assets/5.gif';
                      },
                    ),
                  ],
                ),
              ),
              //text 'Select interval of notification (in seconds 15 to 120)'
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Select interval of notification \n(in seconds 15 to 120)',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'medio'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ValueSelector(),
              ),

              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //elavated button with clid image _imagePath and onpressed _changeImage

                        GestureDetector(
                          onTap: _changeImage,
                          child: Image.asset(
                            _imagePath,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //add image start
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 40, top: 20),
                    child: Row(
                      //arrage elements to start
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          _txtImg,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  //add image round1
                ],
              ),
              //button with text 'History', onpressed navigate to history, border white 2, color same as background colour
              Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, EnterRoute(page: History()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff020202),
                    onPrimary: Color(0xffffffff),
                    side: BorderSide(width: 2.0, color: Color(0xffffffff)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text(
                    'History',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'medio'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
