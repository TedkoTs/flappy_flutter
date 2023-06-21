import 'dart:async';
import 'package:flappy_flutter/barrier.dart';
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
  double velocity = 3;
  bool hasGameStarted = false;
  int currentScore = 0;
  int bestScore = 0;

  void playGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPosition - height;
      });
      time += 0.03;

      if (isDead()) {
        timer.cancel();
        showMenu();
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

  void reset() {
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      hasGameStarted = false;
      time = 0;
      initialPosition = birdY;
    });
  }

  void showMenu() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 118, 75, 60),
          title: const Center(
            child: Text(
              'N I C E  T R Y',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: reset,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Text(
                    'TRY AGAIN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 77, 48, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
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
                      Container(
                        alignment: const Alignment(0, -0.5),
                        child: Text(
                          hasGameStarted ? '' : 'T A P  T O  F L Y',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        alignment: const Alignment(0, 1),
                        duration: const Duration(milliseconds: 0),
                        child: const Barrier(height: 200),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
              color: const Color.fromARGB(255, 123, 200, 41),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 65, 73, 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Score: $currentScore',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text('High Score: $bestScore',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
