import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:the_dealership/Pages/fleet.dart';
import 'package:the_dealership/Pages/homepage.dart';

import 'Pages/login.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) =>homepage())
    );
  }

  /*Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 256.0),
      alignment: Alignment.bottomCenter,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Pick And Choose",
          body:
          "At the dealership,your specifications are our forte.wWe have you covered with all your Car needs",
          image: Image(image: AssetImage('assets/images/caddy.png'),height: 150, width: 400,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Rentals",
          body:"Our fleet has all your rental needs for casual and professional needs",
          image: Image(image: AssetImage('assets/images/Rentals.png'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Luxury At its Peak",
          body:
          "User can manage their profiles and get profile based recommendations",
          image: Image(image: AssetImage('assets/images/lux.png'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fleet",
          body:
          "A wide Range of used and brand-new cars just for you our cherished clients."
              "Sit back and fasten your seat belt for "
              "our journey into the dealership ",
          image: Image(image: AssetImage('assets/images/fleet.png'),height: 150, width: 400,),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator
        (
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}