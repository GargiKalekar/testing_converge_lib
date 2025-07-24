import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String _displayText = 'itka pan crazy nako';
  final _database = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _database.child("dailySpecial/description").onValue.listen(
      (event) {
        final String description = event.snapshot.value.toString();
        setState(() {
          _displayText = 'gargi and aabha in rh: $description';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('read'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(_displayText),
            ],
          ),
        ),
      ),
    );
  }
}
