import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../classes.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 200,
                          height: 200,
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
                ),
              );
  }
}