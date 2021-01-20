import 'package:flutter/material.dart';

import './quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Private class. use _
// State is a generic glass
// state is persistent
// <MyApp> tells this class belongs to MyApp
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  int _totalScore = 0;

  void _answerQuestion(int score) {
    // Set state takes anonymous function
    // Forces to re-render
    // Re build entire tree but internally knows what changed or not
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  // Add const to avoid changing of variable
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text':'Black', 'score': 4},
        {'text':'Red', 'score': 3},
        {'text':'Green', 'score': 2},
        {'text':'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text':'Dog', 'score': 4},
        {'text':'Bird', 'score': 3},
        {'text':'Cat', 'score': 2},
        {'text':'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [ 
        {'text':'Burger', 'score': 4},
        {'text':'Pizza', 'score': 3},
        {'text':'Bread', 'score': 2},
        {'text':'Rice', 'score': 1}
      ],
    },
  ];

  // Reset quiz
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  //Override with own implementation
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
              answerQuestion: _answerQuestion,questionIndex:_questionIndex, questions: _questions
            )
            : Result(_totalScore, _resetQuiz
      ),
    ));
  }
}
