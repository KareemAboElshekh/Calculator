import 'package:flutter/material.dart';

class CalculatorButoon extends StatelessWidget {
  String text;
  Function onPressed;

  CalculatorButoon({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(2),
            child: ElevatedButton(
                onPressed: () {
                  onPressed(text);
                },
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ))));
  }
}
