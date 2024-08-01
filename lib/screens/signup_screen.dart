import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flashnews/models/colors.dart';
import 'package:flashnews/models/textstyles.dart';
import 'package:flashnews/providers/auth_provider.dart';
import 'package:flashnews/screens/home_screen.dart';
import 'package:flashnews/screens/login_screen.dart';
import 'package:flashnews/widgets/custom_button.dart';
import 'package:flashnews/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                      controller: provider.nameController,
                      label: Text("Name"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: provider.emailController,
                      label: Text("Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: provider.passwordController,
                      label: Text("Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : Custombutton(
                      onTap: () async {
                        print('button pressed');
                        await provider.register();
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
                        "signup",
                        style: TextStyles.buttontext,
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyles.labels,
                    ),
                    Text(
                      "Login",
                      style: TextStyles.textbutton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    ;
  }
}
