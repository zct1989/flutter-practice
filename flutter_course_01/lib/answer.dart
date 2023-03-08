import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback _answerQuestion;
  final String _answerTexts;

  const Answer(this._answerQuestion, this._answerTexts, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _answerQuestion,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, minimumSize: const Size(100, 100)),
      child: Text(_answerTexts),
    );
  }
}
