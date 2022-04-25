import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text);
@override
  Widget build(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.all(5),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );

  }
}