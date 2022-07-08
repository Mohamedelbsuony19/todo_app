
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';
import 'package:todo_app/Ui/ui_utlis.dart';
import 'package:todo_app/firebase_utlis.dart';
import 'package:todo_app/model/task.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  GlobalKey<FormState>formControl = GlobalKey<FormState>();
  String title ='';
  String descrbtion ='';
  DateTime seclededDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<appProvider>(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color:prov.themeMode==ThemeMode.light? Colors.white:Colors.black,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(15) ,topRight:Radius.circular(15) )

        ),
        padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Task',
                style: Theme.of(context).textTheme.headline1?.copyWith(color:Colors.black ),
              textAlign :TextAlign.center,
              ),
              Form(
                key: formControl,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title'
                  ),
                  onChanged: (text){
                    title=text;
                    },
                  validator: (text){
                    if(text==null || text.isEmpty){
                      return 'please enter tittle';
                    }return null; 
                  },
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Description'
                  ),
                  onChanged: (text) {
                    descrbtion=text;
                    },
                  validator: (text){
                    if(text==null || text.isEmpty){
                    return 'please enter tittle';
                  }return null;
                    },
                ),
                SizedBox(height: 12,),
                Text('Task Date'),
                SizedBox(height: 8,),
                InkWell(
                  onTap: (){choosedate();},
                    child: Text('${seclededDate.year}-${seclededDate.month}-${seclededDate.day}',textAlign: TextAlign.center,)),
                SizedBox(height: 12,),
              ],)
              ),
              ElevatedButton(onPressed: (){
                addTask();
              }, child: Text('Add Task'))
            ],
          ),
      ),
    );
  }


  void choosedate()async {
    var chosendate= await showDatePicker(
        context: context,
        initialDate: seclededDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if(chosendate !=null){
    seclededDate=chosendate;
    setState(() {

    });
    }
  }
  void addTask() {
    if(formControl.currentState?.validate()==true){
      Task task=Task(title: title, description: descrbtion,
          date:DateUtils.dateOnly(seclededDate).millisecondsSinceEpoch);
      showloading('loading...', context,isCancleble: false);
      AddTaskToFireStore(task)
          .then((value){
            hideDailog(context);
            showMessage(context, 'Task was added successfull', 'ok', () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
      }).catchError((onError){
        hideDailog(context);
        showMessage(context, 'Error Try Again ', 'ok', () {
          Navigator.pop(context);
          Navigator.pop(context);
      });
    });
  }
}
}
