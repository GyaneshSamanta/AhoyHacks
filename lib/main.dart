import 'package:ahoy_hacks/screens/forgot_password.dart';
import 'package:ahoy_hacks/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'screens/create_new_account.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ahoy Hacks",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        // '/': (ctx) => LoginScreen(),
        // '/': (ctx) => ForgotPassword(),
        // '/': (ctx) => CreateNewAccount(),
        // '/': (ctx) => const HomeScreen()
        // HomeScreen.routeName: (ctx) => HomeScreen()
      },
    );
  }
}
