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
              calendarBuilders: CalendarBuilders(
                markerBuilder:(context, day, events) {
                  if (events.isNotEmpty) {
                    List iconEvents = events;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        Map key = iconEvents[index];
                        if (key['iconIndex'] == 1) {
                          return Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: Icon(
                              size: 20.sp,
                              Icons.cruelty_free_outlined,
                              color: Colors.purpleAccent
                            ),
                          );
                        } else if (key['iconIndex'] == 2) {
                          return Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: Icon(
                              size: 20.sp,
                              Icons.liquor_outlined,
                              color: Colors.yellowAccent
                            )
                          );
                        } else if (key['iconIndex'] == 3) {   // NOTE :: 수행(기도자의 마음으로)
                          return Container(
                            margin: EdgeInsets.only(top: 40.h),
                            child: Icon(
                              size: 20.sp,
                              Icons.commit_outlined,
                              color: Colors.brown
                            )
                          );
                        }
                        return null;
                      },
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (BuildContext context, StateSetter dialogSetState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    title: const Text('일정 추가하기'),
                    actions: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: CustomTextField(text: '일정 내용', hintText: '내용을 입력해주세요.', controller: _textEditingController,)
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 17.w, right: 15.w),
                        child: Text('캘린더에 표시할 마커를 선택하세요', style: TextStyle(fontSize: 20.sp))
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Container(
                          width: 300.w,
                          height: 120.h,
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 0,
                                blurRadius: 5.0,
                                offset: const Offset(0, 10)
                              )
                            ],
                            color: Colors.teal,
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if(_color2 == Colors.grey && _color3 == Colors.grey) {
                                    dialogSetState(() {
                                      _color1 = (_color1 ==Colors.purpleAccent) ? Colors.grey : Colors.purpleAccent;
                                    });
                                    if(_color1 == Colors.grey) {
                                      selectMarker = 0;
                                    } else {
                                      selectMarker = 1;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Icon(
                                    size: 20.sp,
                                    Icons.cruelty_free_outlined,
                                    color: Colors.purpleAccent
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              GestureDetector(
                                onTap: () {
                                  if(_color1 == Colors.grey && _color3 == Colors.grey) {
                                    dialogSetState(() {
                                      _color2 = (_color2 ==Colors.teal) ? Colors.grey : Colors.teal;
                                    });
                                    if(_color2 == Colors.grey) {
                                      selectMarker = 0;
                                    } else {
                                      selectMarker = 2;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Icon(
                                    size: 20.sp,
                                    Icons.liquor_outlined,
                                    color: Colors.yellowAccent
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              GestureDetector(
                                onTap: () {
                                  if(_color1 == Colors.grey && _color2 == Colors.grey) {
                                    dialogSetState(() {
                                      _color3 = (_color3 ==Colors.redAccent) ? Colors.grey : Colors.redAccent;
                                    });
                                    if(_color3 == Colors.grey) {
                                      selectMarker = 0;
                                    } else {
                                      selectMarker = 3;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Icon(
                                    size: 20.sp,
                                    Icons.commit_outlined,
                                    color: Colors.brown
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      TextButton(
                        onPressed: () {
                          if(selectMarker != 0) {
                            if(_textEditingController.text == '') {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  title: const Text('Null'),
                                  content: const Text('일정 내용을 추가하지 않았습니다!'),
                                  actions: <Widget> [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK')
                                    )
                                  ]
                                )
                              );
                            } else {
                              var maxIconCount = context.read<EventsProvider>().setEvents(_selectedDay, _textEditingController, selectMarker);
                              if(maxIconCount == '초과') {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    title: const Text('입력 초과'),
                                    content: const Text('일정에 추가 가능한 개수는 3개입니다.'),
                                    actions: <Widget> [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Ok')
                                      )
                                    ]
                                  ),
                                );
                              } else {   // NOTE :: 등록 성공 시
                                _color1 = Colors.grey;
                                _color2 = Colors.grey;
                                _color3 = Colors.grey;
                                _textEditingController.clear();
                                selectMarker = 0;
                              }
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                title: const Text('Null'),
                                content: const Text('마커를 지정하지 않았습니다. 마커를 지정해주세요.'),
                                actions: <Widget> [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Ok'),
                                  )
                                ]
                              )
                            );
                          }
                        },
                        child: Text('Ok', style: TextStyle(fontSize: 20.sp),)
                      )
                    ],
                  );
                });
              }
            );
          },
        ),
      ),
    );
  }
}