import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flappy_flutter/bird.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  static double birdY = 0.0;
  double initialPosition = birdY;
  double height = 0.0;
  double time = 0.0;
  double gravity = -4.9;
  double velocity = 2.5;
  bool hasGameStarted = false;

  void playGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPosition - height;
      });
      time += 0.025;

      if (isDead()) {
        timer.cancel();
        hasGameStarted = false;
      }
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPosition = birdY;
    });
  }

  bool isDead() {
    if (birdY < -1 || birdY > 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasGameStarted ? jump : playGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: const Color.fromARGB(255, 30, 173, 244),
                child: Center(
                  child: Stack(
                    children: [
                      Bird(
                        birdY: birdY,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 77, 48, 38),
              ),
            )
          ],
        ),
      ),
    );
  }
}
