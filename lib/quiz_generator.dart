import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class QuizGenerator extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) onAnswer;

  const QuizGenerator({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['resposta'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(questions[selectedQuestion]['image'] as String,
            questions[selectedQuestion]['texto'] as String),
        ...answers.map((ans) {
          return Resposta(
            ans['text'].toString(),
            () => onAnswer(int.parse(ans['value'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
