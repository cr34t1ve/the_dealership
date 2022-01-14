import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {

  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // defaultTransition: Transition.rightToLeft,
      // transitionDuration: Duration(milliseconds: 500),
      themeMode:ThemeMode.system ,
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      home: HomePage(),
    );
  }
}
