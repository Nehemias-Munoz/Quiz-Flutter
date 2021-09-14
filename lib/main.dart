import 'package:flutter/material.dart';

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
  int questionNumber = 0;

  List<Widget> scoreKeeper = [];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  List<bool> answer = [
    false,
    true,
    true,
  ];

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
                questions[questionNumber],
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
                bool correctAnswer = answer[questionNumber];
                if (correctAnswer == true) {
                  print('Correct');
                } else {
                  print('Wrong');
                }
                setState(() {
                  questionNumber++;
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
                bool correctAnswer = answer[questionNumber];
                if (correctAnswer == false) {
                  print('Correct');
                } else {
                  print('Wrong');
                }
                setState(() {
                  questionNumber++;
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