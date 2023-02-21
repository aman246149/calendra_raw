library calendra_raw;

import 'package:jiffy/jiffy.dart';

import 'helper_function.sdart.dart';

class CalendraRaw {
  static final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  /// 1 index means january, 2 index means February and so on
  ///Month index is Required here
  ///Default year will be CurrentYear

  static List<DateTime> monthlyDates({required int monthIndex, int year = 0}) {
    int defaultYear = DateTime.now().year;
    List<DateTime> monthDays = [];
    if (year != 0) {
      defaultYear = year;
    }
    DateTime first = DateTime(defaultYear, monthIndex, 1);
    DateTime end = Jiffy(first).add(months: 1, days: -1).dateTime;

    monthDays = HelperFunctions.getDatesBetween(first, end);
    return monthDays;
  }

  /// Generate a List of Maps of Days with dates.. example-- [{Monday: 2023-02-13 00:00:00.000}]
  ///Month index is Required here
  ///Default year will be CurrentYear
  static List<Map> monthlyDatesWithWeekDays(
      {required int monthIndex, int year = 0}) {
    int defaultYear = DateTime.now().year;
    List<Map<String, dynamic>> monthDaysWithDays = [];
    if (year != 0) {
      defaultYear = year;
    }
    DateTime first = DateTime(defaultYear, monthIndex, 1);
    DateTime end = Jiffy(first).add(months: 1, days: -1).dateTime;

    List<DateTime> monthsDate = HelperFunctions.getDatesBetween(first, end);
    for (var i = 0; i < monthsDate.length; i++) {
      monthDaysWithDays
          .add({HelperFunctions.getDayOfWeek(monthsDate[i]): monthsDate[i]});
    }

    return monthDaysWithDays;
  }

  ///Generate whole year calendra
  ///Year is a required parameter here
  ///Example   [{0: [{Sunday: 2023-01-01 00:00:00.000}, {Monday: 2023-01-02 00:00:00.000}]
  ///It will return a map having index 0-11 represent the months
  ///
  static List<Map> generateWholeYearCalendra({required int year}) {
    List<Map> dates = [];
    for (var i = 1; i <= 12; i++) {
      dates.add({i - 1: monthlyDatesWithWeekDays(monthIndex: i, year: year)});
    }

    return dates;
  }
}
