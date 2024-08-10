import 'package:flutter/material.dart';
import 'package:hire_me_customer/views/screens/auth/login_screen.dart';
import 'package:hire_me_customer/views/screens/auth/welcome_screens/welcome_register_screen.dart';

class WelcomeLoginScreen extends StatefulWidget {
  const WelcomeLoginScreen({super.key});

  @override
  State<WelcomeLoginScreen> createState() => _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends State<WelcomeLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: 0,
              left: -40,
              child: Image.asset(
                'assets/icons/store.png',
                width: screenWidth + 80,
                height: screenHeight + 100,
              ),
            ),
            Positioned(
              top: screenHeight * 0.151,
              left: screenWidth * 0.024,
              child: Image.asset(
                'assets/icons/store.png',
              ),
            ),
            Positioned(
              top: screenHeight * 0.641,
              left: screenWidth * 0.07,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomerLoginScreen();
                  }));
                },
                child: Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.085,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'login as customer',
                      style: TextStyle(
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.77,
              left: screenWidth * 0.07,
              child: Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.085,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'login as seller',
                    style: TextStyle(
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: screenHeight * 0.88,
                left: screenWidth * 0.065,
                child: Row(
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.022,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return WelcomeRegisterScreen();
                        }));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
