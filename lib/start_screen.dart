import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/kunkun.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 50),
          const Text(
            '你真的了解坤坤吗？',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 97, 64, 243),
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Color.fromARGB(255, 81, 98, 252),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              '开始答题',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 55, 0, 253),
              ),
            ),
          )
        ],
      ),
    );
  }
}
