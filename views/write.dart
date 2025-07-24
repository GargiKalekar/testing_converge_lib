import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}
class _WriteState extends State<Write>{
  final database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context){
    final dailySpecialRef = database.child('dailySpecial/');//this is the child of tree(leading or ending slashes are optional)

    return Scaffold(
      appBar: AppBar(title: Text('write'),),
      body: Center(
        child: Padding(padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){ 
              dailySpecialRef.set({
                'description':'Javachip Frappuchino',
                'price': 230, 
              }).then((_) => print("Data written"))
              .catchError((error)=>print("Error here - $error"));
            }, child:Text('hello database'))
          ],
        ),),
      ),
    );
  }
}