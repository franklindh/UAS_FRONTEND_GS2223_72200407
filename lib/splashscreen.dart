import 'dart:js';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uas_frontend_gs2223_72200407/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required this.title});

  final String title;

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (context) => Home(title: 'Home')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 78, 199, 247),
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }
}
