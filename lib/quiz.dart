import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({
    @required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //List of widgets
      // children: <Widget>[]
      children: [
        // Text has no state
        // Send value to the constructor and return text
        // and access each question
        Question(questions[questionIndex]['questionText']),
        // execute for all element in the list
        // Spread operator (...)
        // Values of list added to list rather than nested list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          // Get reference and forward it to answer
          return Answer(() => answerQuestion (answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
