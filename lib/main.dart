import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';
import 'screens/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ahoy Hacks",
      routes: {
        //'/': (ctx) => LoginScreen(),
        '/': (ctx) => const HomeScreen()
        //HomeScreen.routeName: (ctx) => HomeScreen()
      },
    );
  }
}
