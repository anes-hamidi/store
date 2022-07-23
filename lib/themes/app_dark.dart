import 'package:flutter/material.dart';
import 'package:set_and_get/themes/app_colors.dart';


ThemeData darkTheme = ThemeData(
 
  brightness: Brightness.dark,
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColorDark ,
  primaryColorLight: AppColor.buttonColorDark,
 
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white,
    textTheme: ButtonTextTheme.primary,
  ),
);