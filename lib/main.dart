import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';
import './utils/questions.list.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  var _score = 0;
  static String title = 'Conhecimentos gerais - Quiz';
  final List<Map<String, Object>> perguntas = questionsList;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                onAnswer: onAnswer,
                questions: perguntas,
                selectedQuestion: _perguntaSelecionada,
              )
            : QuizResult(score: _score, restart: onRestart),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
