import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String buttonText;
  final void Function() onSelection;

  const Resposta(this.buttonText, this.onSelection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
          ),
          onPressed: onSelection,
          child: Text(buttonText),
        ),
        const Padding(padding: EdgeInsets.all(3)),
      ],
    );
  }
}
