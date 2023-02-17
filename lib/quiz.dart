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

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(
          const Color.fromARGB(255, 82, 0, 255),
        ),
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
