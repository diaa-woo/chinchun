import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsProvider extends ChangeNotifier {
  DateTime? day;
  Map<String, dynamic> events = {};

  getEvents()
  {
    return events;
  }

  setEvents(day, contents, iconIndex) {
    String dayData = DateFormat('yy/MM/dd').format(day);
    Map<String, dynamic> eventsContents = { "iconIndex": iconIndex, "contents": '$contents'};
    if(events.containsKey(dayData))
    {
      if(events[dayData]!.length < 3)
      {
        events[dayData]!.add(eventsContents);
      }
      else
      {
        return '초과';
      }
    }
    else
    {
      List eventsList = [];
      Map<String, dynamic> selectedEvents = {dayData: eventsList };
      eventsList.add(eventsContents);
      events.addAll(selectedEvents);
    }
  }
}
