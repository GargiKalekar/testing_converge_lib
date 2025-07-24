import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}
class _ReadState extends State<Read>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('read'),),
      body: Center(
        child: Padding(padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [],
        ),),
      ),
    );
  }
}