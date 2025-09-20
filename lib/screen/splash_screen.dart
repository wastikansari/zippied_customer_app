import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippied_app/utiles/constants.dart';
import 'package:zippied_app/widget/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _checkLoggedIn);
  }

  Future<void> _checkLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.TOKEN);

    if (token != null && token.isNotEmpty) {
      // ignore: use_build_context_synchronously
      context.go('/home');
    } else {
      // ignore: use_build_context_synchronously
      context.go('/phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE42033),
              Color.fromARGB(255, 169, 23, 38),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("asset/logo/logo_icon.png", width: 200,),
                // CustomText(
                //   text: 'Zippied',
                //   color: Colors.white,
                //   size: 30,
                //   fontweights: FontWeight.bold,
                // ),
                const Divider(
                  thickness: 0.9,
                  color: Color.fromARGB(143, 218, 218, 218),
                ),
                CustomText(
                  text: 'India\'s First Quick Service App',
                  size: 15,
                  color: Colors.white,
                  fontweights: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
