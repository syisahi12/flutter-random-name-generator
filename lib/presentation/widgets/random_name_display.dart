import 'package:flutter/material.dart';

class RandomNameDisplay extends StatelessWidget {
  final String name;

  const RandomNameDisplay({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}