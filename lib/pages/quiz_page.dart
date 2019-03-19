import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../utils/quiz.dart';
import '../utils/question.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay_state.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    Question('Flutter is awesome', true),
    Question('Today is sunny day', false),
    Question('Work is hard thing', true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.anwswer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () {
              handleAnswer(true);
            }),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () {
              handleAnswer(false);
            })
          ],
        ),
        overlayShouldBeVisible
            ? new CorrectWrongOverlay(
              isCorrect,
              () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, questionNumber)), (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayShouldBeVisible = false;
                  questionText =currentQuestion.question;
                  questionNumber =quiz.questionNumber;
                });
              })
            : new Container()
      ],
    );
  }
}
