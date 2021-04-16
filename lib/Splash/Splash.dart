import 'dart:async';
import 'package:SmartBell/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:SmartBell/common/Preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SmartBell/permitUser/PermitUser.dart';



class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    await Preferences.init();
    bool isOnboardingDone = await Preferences.isOnboardingDone();

    if (isOnboardingDone) {
       Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new LoginScreen()));
   
    } else {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new OnBoardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 500), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(3, 65, 255,0.9),
      body: new Center(
        child: new Text('R.K.G.I.T',style: GoogleFonts.muli(fontSize: 25,color:Colors.white,fontWeight:FontWeight.bold)),
      ),
    );
  }
}
