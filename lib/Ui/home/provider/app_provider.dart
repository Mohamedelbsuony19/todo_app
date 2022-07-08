import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appProvider extends ChangeNotifier{
ThemeMode themeMode=ThemeMode.light;

void changetheme(ThemeMode newtheme)async{
  //final prefs = await SharedPreferences.getInstance();
  this.themeMode=newtheme;
 // prefs.setString('theme',newtheme==ThemeMode.light?'light':'Dark');
  notifyListeners();
}
}