
import 'package:SmartBell/Main/Bluetooth.dart';
import 'package:flutter/material.dart';
import 'Lock.dart';
import 'Insight.dart';
import 'More.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.lock)),
                Tab(icon: Icon(Icons.pie_chart)),
                Tab(icon: Icon(Icons.more)),

              ],
            ),
            title: Text('Welcome'),
          ),
          body: TabBarView(
            children: [
              Lock(),
              FlutterBlueApp(),
              Insight(),
              MoreView()
            ],
          ),
        ),
      ),
    );
  }
}


