import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;    // NOTE :: 표시할 단위 선언
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,     // NOTE :: 달력에서 자동으로 보여줄 날
              firstDay: DateTime(2024,1,1),   // NOTE :: 달력 구성 시, 맨 처음 보여줄 날짜
              lastDay: DateTime(2024,12,31),   // NOTE :: 달력 구성 시, 맨 마지막으로 보여줄 날짜
              headerStyle: const HeaderStyle(
                titleCentered: true,
              ),
              selectedDayPredicate: (day) {        // NOTE :: 캘린더에서 현재 선택된 날짜 지정
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {   // NOTE :: 사용자가 캘린더에서 날짜를 선택할 시 해당 날짜가 _selectedDay로 업데이트되고 화면도 업데이트됨. 이에 선택한 날짜에 대한 변경 사항 표시
                if(!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;   // NOTE :: 사용
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ],
        ),
      ),
    );
  }
}