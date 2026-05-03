import 'package:flutter/material.dart';
import 'package:oroshi/bages/home_screen.dart';
import 'package:oroshi/core/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Image.asset('assets/images/Sushi_name_japan.png', height: 600),
                Positioned(
                  top: 50,
                  left: 30,
                  child: Text(
                    'Oroshi',
                    style: TextStyle(
                      fontSize: 50,
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  // left: 50,
                  child: Image.asset(
                    'assets/images/Mao-sushi.png',
                    // height: 600,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 40,
                  child: Image.asset(
                    'assets/images/Sushi_name_white.png',
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      "The taste of  japanese \n food in your home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: AppColors.whitecolor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                  Text(
                    "Feel the taste of most popular japanese foods from \n anywhre and anytime.",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 30,
                        left: 20,
                        right: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whitecolor.withAlpha(70),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          // light shadow (top-left)
                          BoxShadow(
                            color: AppColors.whitecolor.withAlpha(70),
                            offset: Offset(0, 0),
                            blurRadius: 0,
                          ),
                          // dark shadow (bottom-right)
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 15,
                            // spreadRadius: -  30,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started   ",
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColors.whitecolor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.whitecolor,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
