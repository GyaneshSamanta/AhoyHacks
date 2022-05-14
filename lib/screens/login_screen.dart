import 'package:ahoy_hacks/widgets/password_input.dart';
import 'package:ahoy_hacks/widgets/rounded_button.dart';
import 'package:ahoy_hacks/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/background_image.dart';

import 'home_screen.dart';
import 'create_new_account.dart';
import 'forgot_password.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Ahoy Hacks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  const PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ForgotPassword.routeName),
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: 17, color: Colors.white, height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(CreateNewAccount.routeName),
                child: Container(
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(
                        fontSize: 15, color: Colors.white, height: 1.5),
                  ),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )
      ],
    );
  }
}
