
import 'package:flutter/material.dart';
import 'Lock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Insight extends StatelessWidget {
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:60,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Detail of Person unlocked vault/door", style: TextStyle(color: Colors.lightBlue, fontSize: 18),),
            SizedBox(height: 16,),
            FutureBuilder<List<String>>(
              // get the languageCode, saved in the preferences
              future: getNameList(),
              builder: (BuildContext context, AsyncSnapshot<List<String>> nameList) {
                return _buildList(nameList.data);
              }
              ),
         
          ],
        ),
      ),
    );
  }
  Future<List<String>> getNameList() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();

  	return prefs.getStringList("nameList");
  }
Widget _buildList(List<String> nameList){
    final entries = nameList;
    final List<int> colorCodes = <int>[];
    int code = 0;
   for (int i = 0; i < nameList.length; i++) {
     var val = code + 100;
    colorCodes.add(val);
    code = val;
  }

  return  Expanded(
          child: SizedBox(
            child: ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Card( //                           <-- Card
        child: ListTile(
          title: Text(entries[index]),
        ),
      );
  }
)
)
);
  }

}
