import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          backgroundColor: const Color.fromARGB(255, 252, 100, 100),
          foregroundColor: const Color.fromARGB(255, 245, 238, 238),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
