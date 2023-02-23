import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dark-purple-background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Padding(padding: EdgeInsets.only(top: 100)),
              Image.asset(
                "assets/images/quiz.png",
                width: 175,
                height: 175,
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              const Text(
                "Este quiz foi feito com questões estáticas com o objetivo de estudar o desenvolvimento em Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              const Text(
                "Repository: \nhttps://github.com/nathanhss/flutter-quiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 253, 42),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textDirection: TextDirection.ltr,
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
