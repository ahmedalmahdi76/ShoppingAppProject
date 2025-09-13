import 'package:flutter/material.dart';
import 'package:shopping_project/page_view/page_2.dart';
import 'package:shopping_project/page_view/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'page_view/page_1.dart';

//Main class
class StartingPageView extends StatefulWidget {
  const StartingPageView({super.key});

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

//State class
class _StartingPageViewState extends State<StartingPageView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Body
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              //First Page
              Page1(),
              //Second Page
              Page2(),
              //Third Page
              Page3(),
            ],
          ),
          //Smooth Page Indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const JumpingDotEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  jumpScale: 1.5,
                  activeDotColor: Color.fromARGB(255, 0, 0, 0),
                  dotColor: Color.fromARGB(55, 107, 106, 106),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
