import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../classes.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
                color: Colors.white,

                child: Scaffold(
                  backgroundColor: Colors.white,

                  body: Stack(
                    children: [
                      Positioned(
                        right: 15,
                        top: 10,
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Positioned(
                        top: 500,
                        right: 0,
                        left: 100,
                        child: AnimatedButton(
                          height: 50,
                          width: 200,
                          text: 'Get Started',
                          isReverse: true,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.LEFT_TO_RIGHT,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'CaviarDreams',
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          borderColor: const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: 30,
                          borderWidth: 1,
                          onPress: () {
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 20),
                      //Text "Course Provided by"
                      Positioned(
                        bottom: 200,
                        left: 0,
                        right: 0,
                        child: Text(
                          'Course Provided by',
                          textAlign: TextAlign.center,
                          style: TextStyles.subheader,
                        ),
                      ),

                      //Moving Photos
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,

                        child: SizedBox(
                          height: 160,

                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),

                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 16,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        'assets/images/sprintsLogo.png',
                                        fit: BoxFit.contain,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.25),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 16,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        'https://i.postimg.cc/pXPn7yQC/microsoft-Logo.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.25),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Text in the center
                      const SizedBox(height: 150),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'This is a final project for the Flutter Course by Sprints',
                          textAlign: TextAlign.center,
                          style: TextStyles.header1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}