import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_dealership/Pages/forgotpassword.dart';
import 'package:the_dealership/Pages/login.dart';
import 'package:the_dealership/Pages/homepage.dart';
import 'package:the_dealership/onboarding.dart';
import 'package:the_dealership/signup.dart';
import 'splash.dart';
import 'package:firebase_database/firebase_database.dart';


import 'Pages/fleet.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());

  if(!kIsWeb){
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();

  }
  else {
    Firebase.initializeApp(

      options: const FirebaseOptions(
        apiKey: "AIzaSyDdZMR7ARnEZlr6mEZe5Eik6ge0IWDH5vc",
        appId: "1:54024417935:web:444acd27e1a2d84ee0f6fa",
        messagingSenderId: "54024417935",
        projectId: "votingumb",

      ),

    );
  }

  //
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // runApp(const App());
}
DatabaseReference clients = FirebaseDatabase.instance.ref().child("Clients");

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      home: SplashScreen(),
         //
         // initialRoute:  SignInScreen.idScreen,
      initialRoute: FirebaseAuth.instance.currentUser== null ? SignInScreen.idScreen: homepage.idScreen,
      routes: {
        SignUP.idScreen:(context) =>SignUP(),
        SignInScreen.idScreen:(context)=>SignInScreen(),
        homepage.idScreen:(context) =>homepage(),
      OnBoardingPage.idScreen:(context) =>OnBoardingPage(),
        ForgotPassword.id:(context)=>ForgotPassword(),
      },


    );

  }
}
