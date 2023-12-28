import 'package:flutter/material.dart';
import 'package:second_project/answer_button.dart';
import 'package:second_project/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currQuestion = question[currQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 30,
                color: const Color.fromARGB(255, 250, 233, 233),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
            // AnswerButton(
            //   answerText: currQuestion.answers[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currQuestion.answers[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currQuestion.answers[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currQuestion.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
