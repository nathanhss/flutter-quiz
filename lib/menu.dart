import 'package:flutter/material.dart';
import 'quiz.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
                "Vamos Jogar!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
                textDirection: TextDirection.ltr,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              const Text(
                "Teste seu conhecimento",
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 253, 42),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
                textDirection: TextDirection.ltr,
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Quiz(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 82, 0, 255),
                  fixedSize: const Size(256, 55.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
                child: const Text(
                  "Iniciar Agora",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(0, 82, 0, 255),
                  fixedSize: const Size(256, 55.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                    side: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 82, 0, 255),
                    ),
                  ),
                ),
                child: const Text(
                  "Sobre",
                  style: TextStyle(
                    color: Color.fromARGB(255, 82, 0, 255),
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
