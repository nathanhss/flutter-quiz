import 'package:flutter/material.dart';
import './result.dart';
import 'quiz_generator.dart';
import './utils/questions.list.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _perguntaSelecionada = 0;
  var _score = 0;
  static String title = 'Conhecimentos gerais - Quiz';
  final List<Map<String, Object>> perguntas = questionsList;

  @override
  void initState() {
    super.initState();
  }

  void onAnswer(int score) {
    setState(() {
      _perguntaSelecionada++;
      _score += score;
    });
  }

  void onRestart() {
    setState(() {
      _perguntaSelecionada = 0;
      _score = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: hasSelectedQuestion
            ? QuizGenerator(
                onAnswer: onAnswer,
                questions: perguntas,
                selectedQuestion: _perguntaSelecionada,
              )
            : QuizResult(score: _score, restart: onRestart),
      ),
    );
  }
}
