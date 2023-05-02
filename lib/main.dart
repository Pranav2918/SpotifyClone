import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/authScreen.dart';
import 'package:spotify_clone/screens/splash.dart';
import 'package:spotify_clone/utils/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      home: const Splash(),
      theme: AppTheme.global,
    );
  }
}
