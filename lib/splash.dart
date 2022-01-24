import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:the_dealership/onboarding.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) =>
           OnBoardingPage(),
        ));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: const Text("DEALERSHIP",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30.0) ,)
        //Image.asset('assets/images/golf.png'),

      ),
    );
  }
}