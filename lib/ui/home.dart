import 'package:flutter/material.dart';
import '../model/question.dart';

import '../util/hexcolor.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name("Os Estados Unidos declarou Independencia em 1776", true),
    Question.name(
        "Ao longo do século XIX, os EUA adquiriram grande quantidade de terras a partir da compra Luisiana, Flórida e Alasca.",
        true),
    Question.name("A moeda oficial usada nos Estados Unidos e O Euro", false),
    Question.name("A lingua oficial do Estados Unidos e o espanhol", false),
    Question.name(
        "a sigla de abreviação de Estados Unidos em inglês USA", true),
    Question.name(
        "o beisebol é o esporte mais popular nos Estados Unidos", false),
    Question.name(
        "o Petroleo é a principal fonte de Energia utilizada nos Estados Unidos",
        true),
    Question.name("Ohio é uma cidade dos Estados Unidos", false),
    Question.name("Nova Iorque é a capital dos Estados Unidos", false),
    Question.name("Os Estados Unidos tem em seu territorio 54 Estados", false)
  ];

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              ),
            ),
            Container(
              height: 120,
              child: Text(questionBank[0].questionText),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
