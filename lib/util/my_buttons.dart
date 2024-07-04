import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButtons({Key? Key, required this.text, required this.onPressed})
      : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
