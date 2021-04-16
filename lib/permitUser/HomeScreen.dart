import 'package:SmartBell/Details/Details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

BluetoothDevice device;
BluetoothState state;
BluetoothDeviceState deviceState;

class HomeScreen extends StatelessWidget {

  final FirebaseUser user;

  HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in Successfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            FlatButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Details()
                        ));
   
  },
  child: Text(
    "Click here to enter your details",
  ),
)
          ],
        ),
      ),
    );
  }
}