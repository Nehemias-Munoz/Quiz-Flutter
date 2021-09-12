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
                'Questions',
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
              onPressed: () {},
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
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              Icon(Icons.dangerous_outlined, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
