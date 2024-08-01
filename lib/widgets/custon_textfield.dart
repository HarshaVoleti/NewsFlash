import 'package:flashnews/models/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.label, this.controller});
  final Widget label;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        cursorColor: MyColors.blue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
          label: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
