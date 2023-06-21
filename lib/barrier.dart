import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double height;

  const Barrier({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 100,
          height: height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 123, 200, 41),
            border: Border.all(
              color: const Color.fromARGB(255, 95, 139, 47),
              width: 10,
            ),
          ),
        ));
  }
}
