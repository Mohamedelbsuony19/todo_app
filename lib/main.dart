import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Ui/edite/edite_ui.dart';
import 'package:todo_app/Ui/home/home_screen.dart';
import 'package:todo_app/Ui/home/my_theme.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';
import 'package:todo_app/Ui/home/settings/setting_tab.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (buildContext){
        return appProvider();
      },
      child: myAppliction()));
}

class myAppliction extends StatelessWidget {
  late appProvider prov;
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    prov=Provider.of<appProvider>(context);
    //shredPrefrance();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(buildContext)=>HomeScreen(),
        editeUi.routeName:(context)=>editeUi(),
        settingtab.routeName:(context)=>settingtab()
      },
      initialRoute:HomeScreen.routeName,
      theme:myThemeData.lightTheme,
      darkTheme: myThemeData.DarkTheme,
      themeMode: prov.themeMode,
    );
  }
  // void shredPrefrance()async{
  //    prefs = await SharedPreferences.getInstance();
  //     if(prefs.getString('theme')=='light'){
  //       prov.changetheme(ThemeMode.light);
  //     }else if(prefs.getString('theme')=='Dark'){
  //       prov.changetheme(ThemeMode.dark);
  //     }
  // }
}

