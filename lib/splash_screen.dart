import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to HomePage after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: RiveAnimation.asset(
            'assets/rive/splash_boy.riv',
          ),
        ),
      ),
    );
  }
}
