import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData.dark(),
      home: Lock(),
    );
  }
}

class Lock extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color:Colors.blueAccent[300]),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
      color: Colors.blueAccent[300],
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                SizedBox(height:20),
              Text('R.K.G.I.T', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:30)),
               SizedBox(height:30),
              Text('Made by', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:24)),
              SizedBox(height:16),
              Text('Shubham Bansal : 1603310217',
                  style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:16)),
               SizedBox(height:10),
              Text('Rishabh Kumar : 1603310177',
                  style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:16)),
                   SizedBox(height:30),
                    Text('Submitted to', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:24)),
                    SizedBox(height:10),
              Text('Mr.Akash Luthra',
                  style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:16))
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:20),
              Text('Product Features', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize:30)),
              SizedBox(height:20),
              Text('(1) Due to the novel coronavirus, people are more inclined towards hygiene. There is a strong need for a locking system that can be locked unlocked without using hand.',
                  style: TextStyle(fontWeight: FontWeight.normal,color:Colors.white,fontSize:16)),
                  SizedBox(height:10),
                  Text('(2) The app also keeps track of all the person unlocking the door. This can be helpful to keep things safe.',
                  style: TextStyle(fontWeight: FontWeight.normal,color:Colors.white,fontSize:16)),
                  SizedBox(height:10),
                  Text('(3) User can scan for the bluetooth device with the help of mobile app.',
                  style: TextStyle(fontWeight: FontWeight.normal,color:Colors.white,fontSize:16))   
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
