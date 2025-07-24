import 'package:flutter/material.dart';
import '../widgets/eventcard.dart'; // Import your EventCard

class TracksTab extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'AI Conference',
      'location': 'Hall A, Tech Park',
      'description': 'A deep dive into the latest advancements in AI technology.',
    },
    {
      'title': 'Flutter Workshop',
      'location': 'Auditorium B',
      'description': 'Hands-on workshop on building apps with Flutter.',
    },
    {
      'title': 'Cybersecurity Panel',
      'location': 'Room 204',
      'description': 'who cares',
    },
    {
      'title': 'Startup Pitch',
      'location': 'Main Stage',
      'description': 'who cares',
    },
    {
      'title': 'Design Thinking Lab',
      'location': 'Innovation Hub',
      'description': 'who cares',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔽 Background Image Layer
        Positioned.fill(
          child: Image.asset(
            'images/iceilogo.jpeg',
            fit: BoxFit.cover,
          ),
        ),

        // 🔼 Foreground ListView with translucent padding
        ListView(
          padding: EdgeInsets.all(12),
          children: events.map((event) {
            return EventCard(
              title: event['title']!,
              location: event['location']!,
              description: event['description']!,
            );
          }).toList(),
        ),
      ],
    );
  }
}
