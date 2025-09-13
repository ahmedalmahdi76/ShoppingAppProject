import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'classes.dart';
import 'authentication/sign_up.dart';
import 'authentication/sign_in.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main Container holding red background
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 95, 0, 0),
              Color.fromARGB(255, 138, 1, 1),
              Color.fromARGB(255, 189, 1, 1),
            ],
          ),
        ),
        //Welcome Text
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text('Welcome to QuickMart',
                   textAlign: TextAlign.center,
                   style: TextStyles.header2),
                ],
              ),
            ),
            //White container with curved top corners
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png', ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Your one-stop shop for everything you need. Enjoy a seamless shopping experience with us!',
                        textAlign: TextAlign.center,
                        style: TextStyles.line,
                      ),
                      SizedBox(height: 20),
                      AnimatedButton(
                          height: 50,
                          width: 200,
                          text: 'Sign In',
                          isReverse: true,
                          selectedTextColor: const Color.fromARGB(255, 0, 0, 0),
                          transitionType: TransitionType.LEFT_TO_RIGHT,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'CaviarDreams',
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          backgroundColor: const Color.fromARGB(255, 58, 1, 1),
                          borderColor: const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: 30,
                          borderWidth: 1,
                          onPress: () {
                            Future.delayed(const Duration(milliseconds: 500), () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        AnimatedButton(
                          height: 50,
                          width: 200,
                          text: 'Sign Up',
                          isReverse: true,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.RIGHT_TO_LEFT,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'CaviarDreams',
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 254, 254, 254),
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          borderColor: const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: 30,
                          borderWidth: 1,
                          onPress: () {
                            Future.delayed(const Duration(milliseconds: 500), () {
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => const SignUpScreen()));
                            });
                          },
                        ),
                      
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
