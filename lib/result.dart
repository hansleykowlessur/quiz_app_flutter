import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String result = 'You did it!';
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            children: [
              Text(
              resultPhrase
              ),
              FlatButton(onPressed: resetHandler, child: Text('Restart Quiz'))
            ],
          )
    );
  }
}