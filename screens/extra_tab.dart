import 'package:flutter/material.dart';


      

class ExtraTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conference Schedule Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Colors.blueAccent),
          columnWidths: {
            0: FixedColumnWidth(120),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[300]),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Session', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Keynote'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('09:00 AM'),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Workshop A'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('11:00 AM'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

   