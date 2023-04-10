import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leaf_snap/ui/onboarding_screen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      precacheImage(AssetImage('assets/images/bg1f.jpg'), context);
      precacheImage(AssetImage('assets/images/ip.jpg'), context);
      precacheImage(AssetImage('assets/images/bg3.jpg'), context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/ecology_psd.png",
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
