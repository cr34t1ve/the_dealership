import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_dealership/Pages/login.dart';
import 'package:the_dealership/Pages/homepage.dart';
import 'splash.dart';

import 'Pages/fleet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

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

         initialRoute:  SignInScreen.idScreen,
      //initialRoute: FirebaseAuth.instance.currentUser== null ? SignInScreen.idScreen: homepage.idScreen,
    );
  }
}
