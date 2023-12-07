// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:quizzler/questoin.dart';
import 'package:quizzler/quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

QuizeBrain quizeBrain = QuizeBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  const QuizePage({super.key});

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answer) {
    bool correctAnswer = quizeBrain.getAnswer();
    setState(() {
      if (quizeBrain.isFinished()) {
        Alert(
          context: context,
          title: "Alert betch",
          desc: 'Questions has end',
          type: AlertType.error,
          buttons: [
            DialogButton(
              onPressed: () => print('clicked'),
              width: 120,
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        quizeBrain.reset();
        scoreKeeper.clear();
        return;
      }

      if (correctAnswer == answer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizeBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // ignore: prefer_const_constructors
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizeBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                print('true clicked');
                checkAnswer(true);
              },
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                print('false clicked');
                checkAnswer(false);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
