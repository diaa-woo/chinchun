import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2024,1,1),
              lastDay: DateTime(2024,12,31)
            ),
          ],
        ),
      ),
    );
  }
}