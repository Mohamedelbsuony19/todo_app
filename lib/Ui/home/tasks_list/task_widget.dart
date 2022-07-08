import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/edite/edite_ui.dart';
import 'package:todo_app/Ui/home/my_theme.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';
import 'package:todo_app/firebase_utlis.dart';
import 'package:todo_app/model/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<appProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .25,
        motion: DrawerMotion(),
        children: [
          SlidableAction(onPressed: (buildContext){
            deleteTaskesFromFirbase(task);
          },
          backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          )

        ],
      ),

      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(editeUi.routeName,arguments: task);
        },
        child: Container(
          decoration: BoxDecoration(
            color:prov.themeMode==ThemeMode.light? Colors.white:Color(0xFF707070),
            borderRadius: BorderRadius.circular(25)
          ),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                color:task.isDone! ? myThemeData.colorGreen : Theme.of(context).primaryColor,
                width: 5,
                height: 80,
              ),

              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(task.title??'',
                    style:task.isDone! ? TextStyle(color: myThemeData.colorGreen,fontSize: 22)
                        :
                    Theme.of(context).textTheme.subtitle1,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(task.description??"",style: Theme.of(context).textTheme.bodyText1,),
                )
              ],
              )
              ),
              InkWell(
                onTap: (){
                  editeDone(task);
                },
                child: task.isDone! ?
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Text('Done !',style: TextStyle(color: myThemeData.colorGreen ,fontSize: 20,
                      fontWeight: FontWeight.bold),),
                    )
                    :
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 25),
                  child: Icon(Icons.check,color: Colors.white,size: 30,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
