import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

bool isOverlayVisible = false;
late Timer overlayTimer;

void startOverlayTimer() {
  overlayTimer = Timer.periodic(Duration(seconds: 10), (timer) {
    // Perform actions to show the overlay
    isOverlayVisible = true;
    FlutterOverlayWindow.showOverlay(height: 200, width: 200);
  });
}

void stopOverlayTimer() {
  overlayTimer.cancel();
  overlayTimer;
  // Perform actions to hide the overlay
  isOverlayVisible = false;
  FlutterOverlayWindow.closeOverlay();
}

class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Overlay Timer Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startOverlayTimer();
                },
                child: Text('Start Timer'),
              ),
              ElevatedButton(
                onPressed: () {
                  stopOverlayTimer();
                },
                child: Text('Stop Timer'),
              ),
              SizedBox(height: 20),
              if (isOverlayVisible) // Conditionally display the overlay
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: Text('Overlay Content'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
