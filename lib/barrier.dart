import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double height;

  const Barrier({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Container(
          width: 100,
          height: height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 123, 200, 41),
            border: Border(
                top: BorderSide(color: Color.fromARGB(255, 95, 139, 47), width: 8),
                left: BorderSide(color: Color.fromARGB(255, 95, 139, 47), width: 8),
                right: BorderSide(color: Color.fromARGB(255, 95, 139, 47), width: 8)),
          )),
    );
  }
}
