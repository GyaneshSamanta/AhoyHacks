// import 'package:ahoy_hacks/screens/forgot_password.dart';
// import 'package:ahoy_hacks/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/create_new_account.dart';
import 'screens/forgot_password.dart';
import 'screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ahoy Hacks",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        CreateNewAccount.routeName: (ctx) => CreateNewAccount(),
        ForgotPassword.routeName: (ctx) => ForgotPassword(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },
    );
  }
}
