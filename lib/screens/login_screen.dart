import 'dart:math';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashnews/models/colors.dart';
import 'package:flashnews/models/textstyles.dart';
import 'package:flashnews/providers/auth_provider.dart';
import 'package:flashnews/screens/home_screen.dart';
import 'package:flashnews/screens/signup_screen.dart';
import 'package:flashnews/services/shared_preferences.dart';
import 'package:flashnews/widgets/custom_button.dart';
import 'package:flashnews/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginInfo? loginInfo;

  @override
  void initState() {
    super.initState();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    _loadSavedLoginInfo(authProvider);
  }

  Future<void> _loadSavedLoginInfo(AuthenticationProvider authProvider) async {
    loginInfo = await authProvider.fetchLoginInfo();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthenticationProvider>(context);

    final size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      color: MyColors.grey,
      child: Scaffold(
        backgroundColor: MyColors.grey,
        appBar: AppBar(
          backgroundColor: MyColors.grey,
          centerTitle: false,
          title: Text(
            "My News",
            style: TextStyles.heading,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: provider.emailController,
                    label: Text('Email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: provider.passwordController,
                    label: Text('password'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Previously Logged Info:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (loginInfo != null) {
                        await provider.loginFromInfo();
                        if (provider.isLoggedin) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                        if (provider.error != '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                provider.error!,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        provider.loginInfo == null
                            ? "No Login Info saved"
                            : provider.loginInfo!.email,
                      ),
                    ),
                  ),
                ],
              )),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : Custombutton(
                      onTap: () async {
                        await provider.login();
                        if (provider.isLoggedin) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                        if (provider.error != '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                provider.error!,
                              ),
                            ),
                          );
                        }
                      },
                      width: size.width * 0.5,
                      child: Text(
                        "Login",
                        style: TextStyles.buttontext,
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New here? ",
                    style: TextStyles.labels,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Singup",
                      style: TextStyles.textbutton,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
