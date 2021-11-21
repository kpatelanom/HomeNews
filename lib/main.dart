import 'package:flutter/material.dart';
import 'dart:io';
import './Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Home News';


  checkConnection() async{
   try {
   final result = await InternetAddress.lookup('google.com');
     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
     }
    } on SocketException catch (_) {
     print('not connected');
   }
  }
  @override
  Widget build(BuildContext context) {
    checkConnection();
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[600],
        accentColor: Colors.red[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomeWidget(),
    );
  }
}

