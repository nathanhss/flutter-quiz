import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto, myImage;

  const Questao(this.myImage, this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 35)),
          SizedBox(
            height: 65,
            width: 65,
            child: Image.asset(myImage),
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          Text(
            texto,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
