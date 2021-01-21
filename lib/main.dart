import 'package:flutter/material.dart';
import 'package:quizzzz_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> Score = [
  ];

  void UserAnswer(bool AnswerPicked){
    bool CorrectAnswers = quizBrain.getAnswers();
    if(AnswerPicked == CorrectAnswers){
      print('Correct!');
    }
    else{
      print('Wrong!');
    }
    setState(() {
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve Reached The End Of The Quiz!',
        ).show();
        quizBrain.reset();
        Score = [];
      }else {
        Score.add(
          Icon(
            AnswerPicked == CorrectAnswers ? Icons.check : Icons.close,
            color: AnswerPicked == CorrectAnswers ? Colors.green : Colors.red,
          ),
        );
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestions(),
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
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                UserAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                UserAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: Score,
        ),
      ],
    );
  }
}