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

  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Verdadeiro cidadão"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 16.9, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "Falso",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correto!"),
      );
      Scaffold.of(context).showSnackBar(snackBar);

      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text("Errado!"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }
}
