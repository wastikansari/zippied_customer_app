import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,

          colors: [Colors.red, const Color.fromARGB(255, 153, 0, 0)],
        ),

        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    );
  }
}
