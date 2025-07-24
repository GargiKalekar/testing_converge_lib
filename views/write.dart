import 'package:flutter/material.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}
class _WriteState extends State<Write>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('write'),),
      body: Center(
        child: Padding(padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [],
        ),),
      ),
    );
  }
}
