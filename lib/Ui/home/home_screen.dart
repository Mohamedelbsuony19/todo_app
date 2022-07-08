import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Ui/home/add_task_sheet.dart';
import 'package:todo_app/Ui/home/provider/app_provider.dart';
import 'package:todo_app/Ui/home/settings/setting_tab.dart';
import 'package:todo_app/Ui/home/tasks_list/tasks_list_tab.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int curintIndex=0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<appProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App',
          style:Theme.of(context).textTheme.headline1 ,
        ),
      ),
      bottomNavigationBar: BottomAppBar(    //عشان نعمل margin
        shape: CircularNotchedRectangle(),  //
        notchMargin: 8,                     //

        child: BottomNavigationBar(
          currentIndex:curintIndex ,
          onTap: (index){
            curintIndex=index;
            setState(() {

            });
          },
          backgroundColor:Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
            BottomNavigationBarItem(icon: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,settingtab.routeName);
                },
                child: Icon(Icons.settings)),label: '')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ShowAddtaskBottonSheet(context);

        },
        shape: StadiumBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width:pro.themeMode==ThemeMode.light? 4 : 0
          )
        ),
        child: Icon(Icons.add),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body:tabs[curintIndex] ,
    );
  }
  List<Widget>tabs=[
    tasksListsTab(),
    settingtab(),

  ];

  void ShowAddtaskBottonSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (buildContext){
      return AddTaskSheet();
    });
  }
}
