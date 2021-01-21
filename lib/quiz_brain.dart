import 'package:quizzzz_flutter/questions.dart';

class QuizBrain {

  int _QuestionNumber = 0;

  List<Questions> QuestionBank = [
    Questions( 'Some cats are actually allergic to humans', true),
    Questions( 'You can lead a cow down stairs but not up stairs.', false),
    Questions( 'Approximately one quarter of human bones are in the feet.',
        true),
    Questions( 'A slug\'s blood is green.', true),
    Questions( 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions( 'It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
         'No piece of square dry paper can be folded in half more than 7 times.',
         false),
    Questions(
         'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
         true),
    Questions(
         'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
         false),
    Questions(
         'The total surface area of two human lungs is approximately 70 square metres.',
         true),
    Questions( 'Google was originally called \"Backrub\".', true),
    Questions(
         'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
         true),
    Questions(
         'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
         true),
  ];

  void nextQuestion(){
    if(_QuestionNumber < QuestionBank.length - 1)
      {
        _QuestionNumber++;
      }
  }

  String getQuestions()
  {
    return QuestionBank[_QuestionNumber].questionText;
  }

  bool getAnswers()
  {
    return QuestionBank[_QuestionNumber].questionAnswer;
  }

  bool isFinished(){
    if (_QuestionNumber >= QuestionBank.length - 1) {
      print('Now returning to the Start!');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _QuestionNumber = 0;
  }
}