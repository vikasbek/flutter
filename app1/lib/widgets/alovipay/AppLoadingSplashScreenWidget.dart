import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app1/widgets/alovipay/LoginScreenWidget.dart';
import 'package:flutter/material.dart';

class AppLoadingSplashScreen extends StatelessWidget {
  const AppLoadingSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/alovi_pay800_px.png',
          ),
          backgroundColor: Colors.blue.shade100,
          duration: 1000,
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 400,
        );
  }
}
