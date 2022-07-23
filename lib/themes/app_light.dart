import 'package:flutter/material.dart';
import 'package:set_and_get/themes/app_colors.dart';


ThemeData lightTheme = ThemeData(
 
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor ,
  primaryColorLight: AppColor.buttonColor,
 
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.black,
    textTheme: ButtonTextTheme.primary,
  ),
);