import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget{

   NotificationWidget({Key key}): super(key : key);
   
   @override
   _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationWidget>{

  @override
  Widget build(BuildContext context){
    return Text("This is notification widget");
  }
}