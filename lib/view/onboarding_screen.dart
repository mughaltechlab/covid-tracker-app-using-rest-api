// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid_tracker/view/onboarding_pages/page2.dart';
import 'package:covid_tracker/view/world_state.dart';
import 'package:flutter/material.dart';
import 'onboarding_pages/page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // making page controller for tracking that we are on which page
  final PageController _controller = PageController();

  // tracking that we are o last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: [
              Page1(),
              Page2(),
            ],
          ),
          Align(
            alignment: Alignment(0, .85),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  onLastPage
                      ? Text('   ')
                      : GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(1);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                  // dot indicator
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: SlideEffect(
                        activeDotColor: Colors.green,
                        dotWidth: 10.0,
                        dotHeight: 5.0,
                      )),

                  // next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorldStateScreen(),
                                ));
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                ]),
          )
        ],
      ),
    );
  }
}
