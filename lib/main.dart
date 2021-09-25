import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
                onPressed: () => checkAnswer(true)),
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
              onPressed: () => checkAnswer(false),
            ),
          ),
          SizedBox(height: 10.0),
          Wrap(
            alignment: WrapAlignment.start,
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }

  void checkAnswer(bool response) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
            closeFunction: () {
              Navigator.pop(context);
              setState(() {
                quizBrain.resetQuestionNumber();
                scoreKeeper = [];
              });
            },
            onWillPopActive: true,
            context: context,
            type: AlertType.warning,
            title: 'Finish',
            buttons: [
              DialogButton(
                child: Text('Reset'),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    quizBrain.resetQuestionNumber();
                    scoreKeeper = [];
                  });
                },
              )
            ]).show();
      } else {
        bool correctAnswer = quizBrain.getQuestionAnswer();
        if (correctAnswer == response) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }
}
