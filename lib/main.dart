import 'package:flappy_flutter/game_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlappyGame());
}

class FlappyGame extends StatelessWidget {
  const FlappyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameView(),
    );
  }
}
