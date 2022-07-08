import 'package:flutter/material.dart';

void showloading(String message,BuildContext context,{bool isCancleble=false}){
  showDialog(context: context, builder: (buildContext){
    return AlertDialog(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message),
          )
        ],
      ),
    );
  },barrierDismissible: isCancleble);
}

void hideDailog(BuildContext context){
  Navigator.pop(context);
}

void showMessage(
    BuildContext context,
    String message,         //الرساله الل هتظهر تقول لليوزر جاري اضافه التاسك
    String posActionText,   // نص الزرار الل هو مثلا ok
    VoidCallback posAction, //الل function بتاعته
    {String? negActoinText=null , VoidCallback? negAction=null,bool isCancleble =true}){
  showDialog(context: context,barrierDismissible: isCancleble, builder: (buildContext){
    List<Widget>actions=[
        TextButton(onPressed: posAction, child: Text(posActionText)),

    ];
    if (negActoinText!=null){
      actions.add(  TextButton(onPressed: negAction, child: Text(negActoinText)));
    }
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message),
      ),
      actions:actions,
    );
  });
}