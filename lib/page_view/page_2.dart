import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../classes.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    //Typewriter Text Animation
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 250.0,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontFamily: 'CaviarDreams',
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'From cart to doorstep, quicker than ever',
                                    textAlign: TextAlign.center,
                                    speed: const Duration(milliseconds: 70),
                                  ),
                                ],
                                totalRepeatCount: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 0,
                      left: 0,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Text('Skip', style: TextStyles.line),
                      ),
                    ),
                  ],
                ),
              );
  }
}