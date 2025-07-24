import 'package:flutter/material.dart';
import '../views/write.dart';
import '../views/read.dart';
class TimingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Read()));

              },
              child: Text("read example")),
          ElevatedButton(onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Write()));}, child: Text("write example"))
        ],
      ),
    );
  }
}
