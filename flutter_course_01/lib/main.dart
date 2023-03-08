import "package:flutter/material.dart";
import "package:flutter_course_01/quiz.dart";
import "package:flutter_course_01/result.dart";

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  final questions = [
    {
      "questionText": "what's your name?",
      "answers": ["little A", "little B", 'little C']
    },
    {
      "questionText": "what's your favorite color?",
      "answers": ["Red", "Black", 'White']
    },
    {
      "questionText": "what's your favorite animals?",
      "answers": ["Pig", "Dog", 'Cat']
    },
  ];

  onAnswer() {
    // if (_questionIndex >= questions.length - 1) {
    //   print("finished");
    // } else {

    // }
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My First App"),
          ),
          body: _questionIndex >= questions.length
              ? const Result()
              : Quiz(
                  questionIndex: _questionIndex,
                  questions: questions,
                  onAnswer: onAnswer)),
    );
  }
}
