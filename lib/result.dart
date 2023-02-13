import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final int score;
  final void Function() restart;

  const QuizResult({
    super.key,
    required this.score,
    required this.restart,
  });

  String get result {
    if (score < 2) {
      return 'Parabéns!';
    } else if (score < 4) {
      return 'Sabe muito!';
    } else {
      return 'Lucy?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: score < 4
              ? Image.asset('assets/images/congratulation.png')
              : Image.asset('assets/images/usb-flash-drive.png'),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Center(
          child: Text(
            result,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Center(
          child: Text(
            'Score: $score',
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15)),
        TextButton(
          onPressed: () => restart(),
          child: const Text('Tentar novamente'),
        )
      ],
    );
  }
}
