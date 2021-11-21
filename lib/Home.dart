import 'package:flutter/material.dart';
import './HomeView.dart';
import './Games.dart';
import './Notification.dart';
import './Profile.dart';
import './Subscribed.dart';

class MyHomeWidget extends StatefulWidget {
  MyHomeWidget({Key key}) : super(key: key);

  @override
  _MyHomeWidgetState createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    MyHomeViewWidget(),
    // Subscribed(),
    Games(),
    NotificationWidget(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home News"),
      ),
      body: Center(
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          // BottomNavigationBarItem(
          //   icon:Icon(Icons.subscriptions),
          //   title: Text("subscribed")
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_circle),
            title: Text('Weather'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications),
            title: Text('Notification')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text('Profile'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
