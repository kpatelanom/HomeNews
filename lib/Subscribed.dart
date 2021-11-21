import 'package:flutter/material.dart';

class Subscribed extends StatefulWidget{

   Subscribed({Key key}): super(key : key);
   
   @override
   _SubscribedState createState() => _SubscribedState();
}

class _SubscribedState extends State<Subscribed>{

  @override
  Widget build(BuildContext context){
    return Text("This is subscribed widget");
  }
}