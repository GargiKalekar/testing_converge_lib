import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/tracks_tab.dart';
import 'screens/timings_tab.dart';
import 'screens/venues_tab.dart';
import 'screens/extra_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ICEIScheduleScreen(),
    );
  }
}

class ICEIScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('ICEI Conference Schedule'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Ongoing"),
              Tab(text: "Upcoming"),
              Tab(text: "Completed"),
              Tab(text: "Schedule"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TracksTab(),
            TimingsTab(),
            VenuesTab(),
            ExtraTab(),
          ],
        ),
      ),
    );
  }
}
