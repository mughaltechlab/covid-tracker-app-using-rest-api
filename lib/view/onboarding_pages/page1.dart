// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    const double imgSize = 350;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/virus1.png'),
          height: imgSize,
          width: imgSize,
        ),
        Text(
          'Developed by',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'LoneWoLf\nCodeziLLa',
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
