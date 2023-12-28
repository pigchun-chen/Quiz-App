import 'package:flutter/material.dart';
import 'package:second_project/data/question.dart';
import 'package:second_project/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question[i].text,
          'correct_answers': question[i].answers[0],
          'user_answers': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = question.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answers'] == data['user_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numCorrectAnswers out $numTotalQuestions questions correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 81, 98, 252),
              ),
              icon: const Icon(Icons.restart_alt_outlined),
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
      ),
    );
  }
}
