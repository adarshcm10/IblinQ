// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'var.dart';

class ValueSelector extends StatefulWidget {
  const ValueSelector({super.key});

  @override
  _ValueSelectorState createState() => _ValueSelectorState();
}

class _ValueSelectorState extends State<ValueSelector> {
  final TextEditingController _textEditingController = TextEditingController();
  //int _value = 15;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = ShareData.value.toString();
  }

  void _incrementValue() {
    setState(() {
      ShareData.value = (ShareData.value + 5).clamp(15, 120);
      _textEditingController.text = ShareData.value.toString();
    });
  }

  void _decrementValue() {
    setState(() {
      ShareData.value = (ShareData.value - 5).clamp(15, 120);
      _textEditingController.text = ShareData.value.toString();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Colors.white),
          onPressed: _decrementValue,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        Container(
          width: 70,
          height: 50,
          //border colour white and radius 10
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: Text(
                ShareData.value.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'digital'),
              ),
            ),
          ),
        ),
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: _incrementValue,
        ),
      ],
    );
  }
}
