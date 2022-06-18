import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

 
void main() {
  runApp(MyApp());

}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }

}
class _MyAppState extends State<MyApp>{
  final _questions = const[
    {'questionText' : 'What\'s your favorite color?',
      'answers' : [
        {'text' : 'Black', 'score' : 10},
        {'text' :'Green', 'score' : 5},
        {'text' : 'Yellow', 'score' : 1}
      ],
    },
    {'questionText' : 'What\'s your favorite animal',
      'answers' : [
        {'text' : 'Cat', 'score': 7},
        {'text' : 'Dog', 'score' : 5},
        {'text' : 'Elephant', 'score' : 2}
      ],
    },

    {'questionText' : 'Who\'s your favorite instructor ',
      'answers' : [
        {'text' : 'Max','score' : 1},
        {'text' : 'Max', 'score' : 1},
        {'text' : 'Max', 'score' : 1}],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if(_questionIndex < _questions.length) {
      print("We have move questions");
    }
    print(_questionIndex);
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
           title: Text('This my first app')
         ),
        body: _questions.length > _questionIndex ? Quiz(answerQuestion: _answerQuestion as Function,questions:  _questions, questionIndex: _questionIndex)
        : Result(_totalScore, _restQuiz),
      ),
    );
  }
  
}