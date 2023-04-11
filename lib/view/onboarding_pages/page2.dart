// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    offset: Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 0)
              ]),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/saqib.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Divider(
            height: 40,
            thickness: 3.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            // (((((((center starting)))))))
            Column(
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Saqib\nAhmed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,

                    color: Colors.amber,
                    fontFamily: 'cursive',
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    letterSpacing: 6.0,
                  ),
                ),
              ],
            ),
            // (((((CENTER ENDING)))))

            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
