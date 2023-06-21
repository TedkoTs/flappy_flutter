import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double birdY;
  const Bird({super.key, required this.birdY});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 30),
      alignment: Alignment(0, birdY),
      child: Image.asset(
        'lib/images/bird.png',
        width: 50,
      ),
    );
  }
}
