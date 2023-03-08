import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final int questionIndex;

  final VoidCallback onAnswer;

  const Quiz(
      {super.key,
      required this.questionIndex,
      required this.questions,
      required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questrion(questions[questionIndex]['questionText'] as String),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: (questions[questionIndex]["answers"] as List<String>)
              .map((answerText) => Answer(onAnswer, answerText))
              .toList(),
        )
      ],
    );
  }
}
