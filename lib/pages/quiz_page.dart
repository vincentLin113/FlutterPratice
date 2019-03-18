import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () {print("TRUE");} ),
            new AnswerButton(false, () {print("FALSE");} )
          ],
        ),
      ],
    );
  }
}
