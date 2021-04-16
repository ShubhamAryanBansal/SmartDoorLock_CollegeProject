import 'package:SmartBell/Splash/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SmartBell/permitUser/PermitUser.dart';
import 'package:provider/provider.dart';
import 'package:SmartBell/common/ApplicationState.dart';

import 'dart:io' show Platform;

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ApplicationState _applicationState = ApplicationState();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
  return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _applicationState)
        ],
  child:MaterialApp(

            title: 'Smart Bell',
            theme: ThemeData(
              accentColor: Colors.blueAccent,
              textTheme: GoogleFonts.muliTextTheme().copyWith(),
              appBarTheme: AppBarTheme(
                color: Colors.white,
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            home: Splash(),
            routes: <String, WidgetBuilder>{'/root': (BuildContext context) => LoginScreen()}
            
            ));
  }
}

