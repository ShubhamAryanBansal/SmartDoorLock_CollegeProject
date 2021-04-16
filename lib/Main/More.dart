import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';


class MoreView extends StatefulWidget {
  MoreView();

  @override
  State<StatefulWidget> createState() {
    return MoreViewState();
  }
}
class MoreViewState extends State<MoreView> {
  var appurl = "";
 
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  SettingsList(
        sections: [
          SettingsSection(
            title: 'Developer',
            tiles: [
        
              SettingsTile(
                title: 'Shubham Bansal',
                subtitle: '',
                leading: Icon(Icons.people),
                onTap: () {
                
                },
              ),
              SettingsTile(
                title: 'Rishabh Kumar',
                subtitle: '',
                leading: Icon(Icons.people),
                onTap: () {
                
                },
              ),
               

              // SettingsTile.switchTile(
              //   title: 'Use fingerprint',
              //   leading: Icon(Icons.fingerprint),
              //   switchValue: true,
              //   onToggle: (bool value) {},
              // ),
            ],
          ),
           SettingsSection(
            title: 'About our college',
            tiles: [
              SettingsTile(
                title: 'R.K.G.I.T',
                subtitle: '',
                leading: Icon(Icons.school),
                onTap: () {
            _launchURL("https://rkgit.edu.in/");
            
                },
              ),

              SettingsTile(
                title: 'Contact',
                subtitle: '',
                leading: Icon(Icons.contact_phone),
                onTap: () {
            _launchURL("https://rkgit.edu.in/contactus/");
            
                },
              ),
            ],
     ),   

          SettingsSection(
            title: 'Show your love to us',
            tiles: [
              SettingsTile(
                title: 'Share our app',
                subtitle: '',
                leading: Icon(Icons.poll),
                onTap: () {
              // Share.share('check out my website https://example.com', subject: "Hey, I am using this astonishing app. Have a look.");
              
              Share.share('Download the app from' + appurl, subject: 'Hey, I am using this astonishing app. Have a look.');
                },
              ),
            ],
     ),     

        ],
      ),
    );
  }
_launchURL(String urlValue) async {
  var url = urlValue;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  
}
