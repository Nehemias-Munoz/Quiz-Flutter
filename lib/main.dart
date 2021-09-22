import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        body: SafeArea(child: QuizApp()),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // lugar para la creacion de variables

  List<Widget> scoreKeeper = []; // lista de aciertos

  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(fontSize: 23.0, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();
                if (correctAnswer == true) {
                  print('Correct');
                } else {
                  print('Wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[400])),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getQuestionAnswer();
                if (correctAnswer == false) {
                  print('Correct');
                } else {
                  print('Wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,