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
              focusedDay: DateTime.now(),     // NOTE :: 달력에서 자동으로 보여줄 날
              firstDay: DateTime(2024,1,1),   // NOTE :: 달력 구성 시, 맨 처음 보여줄 날짜
              lastDay: DateTime(2024,12,31)   // NOTE :: 달력 구성 시, 맨 마지막으로 보여줄 날짜
            ),
          ],
        ),
      ),
    );
  }
}