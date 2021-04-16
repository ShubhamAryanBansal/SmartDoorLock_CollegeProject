
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SmartBell/common/Preferences.dart';
import 'package:SmartBell/permitUser/PermitUser.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Preferences.setOnboarding(false);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/intro/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration1 = const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700,color:Colors.white),
        bodyTextStyle: TextStyle(fontSize: 18.0,color:Colors.white),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.orangeAccent,
        imagePadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.all(20)
        );

const pageDecoration2 = const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700,color:Colors.white),
        bodyTextStyle: TextStyle(fontSize: 18.0,color:Colors.white),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.grey,
        imagePadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.all(20)
        );

const pageDecoration3 = const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700,color:Colors.white),
        bodyTextStyle: TextStyle(fontSize: 18.0,color:Colors.white),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.cyan,
        imagePadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.all(20)
        );

const pageDecoration4 = const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700,color:Colors.white),
        bodyTextStyle: TextStyle(fontSize: 18.0,color:Colors.white),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.green,
        imagePadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.all(20)
        );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Smart Door Lock",
          body: "Hands-Free Door Openers to Help Against the Spread of Coronavirus",
          image: _buildImage('smartlock1'),
          decoration: pageDecoration1,
        ),
        PageViewModel(
          title: "OTP Base Connection",
          body: "No one will be able to connect to the door unless the owner authorizes them.",
          image: _buildImage('smartlock2'),
          decoration: pageDecoration2
        ),
        PageViewModel(
          title: "Insights",
          body: "Get all the insights in the app i.e who unlocked your door and at what time",
          image: _buildImage('smartlock3'),
          decoration: pageDecoration3,
        ),
        PageViewModel(
          title: "Developed by",
          body: "Shubham Bansal(1603310217) & Rishabh Kumar(1603310177)",
          image: _buildImage('smartlock4'),
          decoration: pageDecoration4,
        )
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text("Skip",style: TextStyle(fontWeight: FontWeight.w600,color:Colors.black)),
      next: const Icon(Icons.arrow_forward,color:Colors.black,),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color:Colors.black)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color.fromRGBO(3, 65, 255,0.9),
        activeSize: Size(22.0, 10.0),
        activeColor: Color.fromRGBO(3, 65, 255,0.9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)
          ),
        ),
      ),
    );
  }
}
