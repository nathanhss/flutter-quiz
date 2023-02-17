import 'package:flutter/material.dart';

class NeonButton extends StatefulWidget {
  const NeonButton({super.key});

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
      }),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          for (double i = 1; i < 5; i++)
            BoxShadow(
                color: Colors.purple.shade400,
                blurRadius: 3 * i,
                spreadRadius: -1,
                blurStyle: BlurStyle.outer)
        ]),
        child: TextButton(
          onHover: (hovered) => setState(() {
            isPressed = hovered;
          }),
          onPressed: () {},
          style: TextButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(
            "INICIAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              shadows: [
                for (double i = 1; i < (isPressed ? 8 : 4); i++)
                  Shadow(
                    color: Colors.purple,
                    blurRadius: 3 * i,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
