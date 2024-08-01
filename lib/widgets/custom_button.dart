import 'package:flashnews/models/colors.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton(
      {super.key,
      required this.child,
      required this.width,
      required this.onTap});
  Widget child;
  double width;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
