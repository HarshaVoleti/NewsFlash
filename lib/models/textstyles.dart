import 'package:flashnews/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle logo = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: MyColors.blue,
  );
  static TextStyle title = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle description = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle date = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyColors.navyblue.withOpacity(0.5),
  );
  static TextStyle buttontext = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: MyColors.white,
  );
  static TextStyle textbutton = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: MyColors.blue,
  );
  static TextStyle labels = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: MyColors.navyblue,
  );
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: MyColors.blue,
  );
  static TextStyle headingwhite = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: MyColors.white,
  );

  String timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} years ago';
    } else if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} months ago';
    } else if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} weeks ago';
    } else if (diff.inDays > 0) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
