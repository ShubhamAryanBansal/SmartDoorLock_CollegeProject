import 'package:SmartBell/Main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Details extends StatelessWidget {
   List<String> nameList = List<String>();
   final _nameController = TextEditingController();
   final _emailIDController = TextEditingController();
   final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:60,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Please fill your details", style: TextStyle(color: Colors.lightBlue, fontSize: 24),),
            SizedBox(height: 16,),
            TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Your Name"

                    ),
                    controller: _nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter your email Id"

                    ),
                    controller: _emailIDController,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Enter Your Phone Number"

                    ),
                    controller: _phoneController,
                  ),
                  FlatButton(
  onPressed: () async {
   var name = _nameController.text;
   var email = _emailIDController.text;
   var phone = _phoneController.text;
   DateTime now = DateTime.now();
   String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
   if (name.length > 0 && email.length > 0 && phone.length > 0){
   
  nameList = await getNameList();
 if (nameList == null){
   nameList = List<String>();
 }
  nameList.add(name);
  nameList.add(email);
  nameList.add(phone);
  nameList.add(formattedDate);
  _saveNameList(nameList);
  

    Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MainScreen()
                        ));
   } else {
     Alert(
      context: context,
      type: AlertType.error,
      title: "Value Missing",
      desc: "Kindly fill all the details to proceed further.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
   }
   
  },
  child: Text(
    "Submit",
  ),
)
         
          ],
        ),
      ),
    );
  }

  Future<bool> _saveNameList(List<String> nameList) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setStringList("nameList", nameList);
}
Future<List<String>> getNameList() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

  	return prefs.getStringList("nameList");
  }

}
