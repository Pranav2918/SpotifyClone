import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/images.dart';

import 'onboarding/authScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToAuth();
    super.initState();
  }

  //Navigation after splash
  void moveToAuth() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(AppImages.appLogo),
      ),
    );
  }
}
