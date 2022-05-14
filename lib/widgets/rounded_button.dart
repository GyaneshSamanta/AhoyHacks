import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff5663ff),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonName,
          style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              height: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
