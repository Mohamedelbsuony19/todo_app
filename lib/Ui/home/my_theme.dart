import 'package:flutter/material.dart';

class myThemeData{
  static Color PrimaryColor=Color(0xFF5D9CEC);
  static Color colorLightGreen = Color(0xFFDFECDB);
  static Color colorRed = Color(0xFFEC4B4B);
  static Color colorGreen = Color(0xFF61E757);
  static Color colorBlack = Color(0xFF242424);
  static Color colorWhite = Color(0xFFFFFFFF);
  static const Color greenColor=Colors.greenAccent;

  static final ThemeData lightTheme=ThemeData(
    primaryColor: PrimaryColor,
    colorScheme: ColorScheme(
      primary: PrimaryColor,
      onPrimary: colorWhite,
      secondary: colorLightGreen,
      onSecondary: colorWhite,
      background: colorLightGreen,
      error: Colors.red,
      onError: Colors.red,
      onSurface: Colors.black,
      surface: Colors.white,
      onBackground: PrimaryColor,
      brightness: Brightness.light,
      primaryVariant: PrimaryColor,
      secondaryVariant: PrimaryColor
    ),
    scaffoldBackgroundColor: colorLightGreen,
      appBarTheme: AppBarTheme(
          centerTitle: false,
          color: PrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: colorWhite)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: colorWhite, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              fontSize: 20, color: PrimaryColor, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
              fontSize: 12,
              color: colorBlack
          )
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: PrimaryColor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: PrimaryColor,
        unselectedItemColor: Colors.grey,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colorWhite,
      )
  );

  static final ThemeData DarkTheme=ThemeData(
  primaryColor: PrimaryColor,
  colorScheme: ColorScheme(
  primary: PrimaryColor,
  onSecondary: colorWhite,
  onPrimary: colorWhite,
  secondary: PrimaryColor,
  background: PrimaryColor,
  error: Colors.red,
  onError: Colors.red,
  onSurface: colorWhite,
  surface: PrimaryColor,
  onBackground: colorBlack,
  brightness: Brightness.dark,
  ),

      scaffoldBackgroundColor:Colors.black ,

      appBarTheme: AppBarTheme(
          centerTitle: false,
          color: PrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: colorWhite)),

      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: colorBlack, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              fontSize: 20, color: colorWhite, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
              fontSize: 12,
              color: colorWhite
          )
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: PrimaryColor
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: PrimaryColor,
        unselectedItemColor: colorWhite,
      ),

      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colorWhite,
      )

  );


}