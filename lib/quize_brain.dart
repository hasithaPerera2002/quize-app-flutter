import 'package:rflutter_alert/rflutter_alert.dart';

import 'questoin.dart';

class QuizeBrain {
  List<Question> _questions = [
    Question('Sun is a a star', true),
    Question('Bus have three wheels', false),
    Question('Snake can run', false),
  ];

  int _questionNumber = 0;

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questions[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questions[_questionNumber].answer;
  }

  bool isFinished() {
    return _questionNumber == (_questions.length - 1);
  }

  void reset() {
    _questionNumber = 0;
  }
}
