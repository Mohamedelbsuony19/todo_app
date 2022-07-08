import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';

import '../../firebase_utlis.dart';
import '../../model/task.dart';
import '../ui_utlis.dart';

class editeUi extends StatefulWidget {
  static const String routeName='edite';

  @override
  State<editeUi> createState() => _editeUiState();
}

class _editeUiState extends State<editeUi> {
  String title ='';

  String descrbtion ='';

  DateTime seclededDate=DateTime.now();

  GlobalKey<FormState>formControl = GlobalKey<FormState>();

  late Task task;

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<appProvider>(context);
  task =ModalRoute.of(context)!.settings.arguments as Task;    // داا
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Task',
            style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
    ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
              color: Color(0xFF5D9CEC),

            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  left: 20,
                  top: MediaQuery.of(context).size.height*0.07,
                  bottom: MediaQuery.of(context).size.height*0.09
              ),
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.68,
              decoration: BoxDecoration(
                color:pro.themeMode==ThemeMode.light? Colors.white:Color(0xFF707070),
                borderRadius: BorderRadius.circular(22)
              ),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.34,
                          top: 10
                        )
                        ,child: Text('Edit Task',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)
                    )
                  ]
                    ,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20 ),
                    child: Form(
                        key: formControl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              initialValue: task.title,
                              decoration: InputDecoration(
                                  labelText: 'Title'
                              ),
                              onChanged: (text){
                               task.title=text;
                              },
                              validator: (text){
                                if(text==null || text.isEmpty){
                                  return 'please enter tittle';
                                }return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              initialValue: task.description,
                              minLines: 2,
                              maxLines: 2,
                              decoration: InputDecoration(
                                  labelText: 'Description'
                              ),
                              onChanged: (text) {
                                task.description=text;
                              },
                              validator: (text){
                                if(text==null || text.isEmpty){
                                  return 'please enter tittle';
                                }return null;
                              },
                            ),
                            SizedBox(height: 40,),
                            Text('Choose Date',style: TextStyle(color: Colors.red),),
                            SizedBox(height: 8,),
                            InkWell(//مفيش سنه ولا شهر ولا يوم   انا كنت عاملها بس اما استخمت الل task مجتش استنا اوريك
                                onTap: (){choosedate();},
                                child: Text('${_convertMilliSecondToDate(task.date??0)}',
                                  textAlign: TextAlign.center,)
                            ),
                            SizedBox(height: 12,),
                          ],)
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  ElevatedButton(onPressed: (){
                      editethisTask();
                  },
                      child: Text('Save Changes'))

                ],
              ),
            ),
          )
        ],
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
      task.date!=chosendate;
      setState(() {

      });
    }
  }
  _convertMilliSecondToDate(int milliseconds){
    DateTime date =  DateTime.fromMillisecondsSinceEpoch(milliseconds);
    var format =  DateFormat("yMd"); //طب اي دي
    var dateString = format.format(date);

    return dateString;
  }

  void  editethisTask()async{
    var value= await editeTask(task);
    Navigator.pop(context);

  }

}
