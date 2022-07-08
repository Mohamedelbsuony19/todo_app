import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/settings/theme_botton_sheet.dart';

import '../provider/app_provider.dart';

class settingtab extends StatefulWidget {
  static String routeName='setting';

  @override
  State<settingtab> createState() => _settingtabState();
}

class _settingtabState extends State<settingtab> {
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<appProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings',
          style: Theme.of(context).textTheme.headline1,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Theme',
                style:Theme.of(context).textTheme.headline1?.copyWith
                  (color:prov.themeMode==ThemeMode.light? Colors.black:Colors.white,fontSize: 23)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                showThemeModeBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Light',style:Theme.of(context).textTheme.subtitle1?.
                  copyWith(color:prov.themeMode==ThemeMode.light? Colors.black:Theme.of(context).primaryColor),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).primaryColor)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeModeBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext){
      return themeBottonSheet();
    });
  }
}
