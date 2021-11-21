import 'package:flutter/material.dart';

class Games extends StatefulWidget{

   Games({Key key}): super(key : key);
   
   @override
   _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games>{

  @override
  Widget build(BuildContext context){
    return Text("This is Games widget");
  }
}