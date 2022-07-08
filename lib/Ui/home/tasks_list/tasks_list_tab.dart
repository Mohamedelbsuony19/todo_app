import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';
import 'package:todo_app/Ui/home/tasks_list/task_widget.dart';
import 'package:todo_app/firebase_utlis.dart';
import 'package:todo_app/model/task.dart';

class tasksListsTab extends StatefulWidget {
  @override
  State<tasksListsTab> createState() => _tasksListsTabState();
}

class _tasksListsTabState extends State<tasksListsTab> {
    DateTime selctedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<appProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selctedDate,                  // يبدا باليوم الحالي
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if(date==null)return;
              selctedDate=date;
              setState((){});
            },
            leftMargin: 20,
            monthColor:prov.themeMode==ThemeMode.light?Colors.black :Colors.white,
            dayColor:prov.themeMode==ThemeMode.light? Colors.black : Colors.white,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor:prov.themeMode==ThemeMode.light? Colors.white:Colors.black,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child:   StreamBuilder<QuerySnapshot<Task>>(
              stream: ListenForTasks(selctedDate),
              builder: (buildContext,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Text('error Try Again');
                }
                List<Task> TaskList=
                    snapshot.data?.docs.map((docSnap) =>docSnap.data() ).toList()?? [];
               // TaskList=TaskList.where((task) => task.date==DateUtils.dateOnly(selctedDate).millisecondsSinceEpoch).toList();
                return ListView.builder(itemBuilder: (_,index){
                  return TaskWidget(TaskList[index]);
                },itemCount: TaskList.length,);

              },
            )
          )
        ],

      ),
    );
  }
}
