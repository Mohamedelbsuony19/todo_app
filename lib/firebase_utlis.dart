import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/task.dart';

CollectionReference<Task>getTasksCollection(){  //دي مفيهاش مشكله جربتهاا
  var typedCollction=FirebaseFirestore.instance.collection('tasks')
      .withConverter<Task>(
      fromFirestore: (snapshot,options)=>Task.fromjson(snapshot.data()!),
      toFirestore: (task,options)=>task.toJson());
  return typedCollction;
}

Future<void> AddTaskToFireStore(Task task) {
  var collection = getTasksCollection();
  var docRef =collection.doc();
  task.id=docRef.id;
  return docRef.set(task);
}

void deleteTaskesFromFirbase(Task task){
  getTasksCollection()
      .doc(task.id)
      .delete();
}

Future<QuerySnapshot<Task>> getTasks(DateTime dateTime){
 return getTasksCollection()
 .where('date', isEqualTo:DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .get();
}

Stream<QuerySnapshot<Task>> ListenForTasks(DateTime dateTime){
 return getTasksCollection().where('date', isEqualTo:DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

editeDone(Task task){
   CollectionReference todiref= getTasksCollection();
   todiref.doc(task.id).update({'isDone':task.isDone! ?false:true});
}

Future<void>editeTask(Task task){
   CollectionReference todiref= getTasksCollection();

  return todiref.doc(task.id).update({

    'title':task.title,
    'description':task.description,
  //  'date':_convertMilliSecondToDate(task.date??0)
  }
  );
}






_convertMilliSecondToDate(int milliseconds){
  DateTime date =  DateTime.fromMillisecondsSinceEpoch(milliseconds);
  var format =  DateFormat("yMd");
  var dateString = format.format(date);

  return dateString;
}