import 'package:flutter/material.dart';

import '../util/hexcolor.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Verdadeiro cidadão"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/flag.png",
              width: 250,
              height: 180,
            )
          ],
        ),
      ),
    );
  }
}
