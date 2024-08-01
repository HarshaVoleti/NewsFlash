import 'dart:async';

import 'package:flashnews/models/colors.dart';
import 'package:flashnews/models/textstyles.dart';
import 'package:flashnews/screens/home_screen.dart';
import 'package:flashnews/screens/login_screen.dart';
import 'package:flashnews/services/auth_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isLoggedIn = false;
    AuthServices().checkLogin().then((value) {
      isLoggedIn = value;
    });
    Timer(Duration(seconds: 1), () {
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My News",
              style: TextStyles.logo,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: MyColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
