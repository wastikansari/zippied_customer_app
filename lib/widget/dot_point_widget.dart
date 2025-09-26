import 'package:flutter/material.dart';

class DotPointHorizontal extends StatelessWidget {
  const DotPointHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(20, (index) {
        return Expanded(
          child: Container(
            height: 0.8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 216, 216),
              // shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}

class DotPointVertical extends StatelessWidget {
  const DotPointVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(20, (index) {
        return Expanded(
          child: Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 216, 216),
              // shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
