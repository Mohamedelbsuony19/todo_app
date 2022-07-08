import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';

class themeBottonSheet extends StatefulWidget {
  @override
  State<themeBottonSheet> createState() => _themeBottonSheetState();
}

class _themeBottonSheetState extends State<themeBottonSheet> {
  @override
  Widget build(BuildContext context) {
    var prvider=Provider.of<appProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            child:getSelectedTheme('Light', prvider.themeMode==ThemeMode.light),
            onTap: (){
                    prvider.changetheme(ThemeMode.light);
            },
          ),
          InkWell(child:getSelectedTheme('Dark', prvider.themeMode==ThemeMode.dark),
          onTap: (){
                prvider.changetheme(ThemeMode.dark);
          },
          )
        ],
      ),
    );
  }

  getSelectedTheme(String text,bool isSelcted){
    if(isSelcted){
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Light',style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black)),
        ),Icon(Icons.check,color: Theme.of(context).primaryColor,)
        ],
      );
    }
    else{
      return  Row(
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
    child: Text('Dark',style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),),
    ),
    ],
    );
    }
  }
}
