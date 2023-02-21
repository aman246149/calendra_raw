

class HelperFunctions{
  /// Generate dates between two dates
  static List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> dates = [];
    for (var d = startDate;
    d.isBefore(endDate.add(const Duration(days: 1)));
    d = d.add(const Duration(days: 1))) {
      dates.add(d);
    }
    return dates;
  }

  ///
  ///Generate day for dateTime example-- monday,tuesday etc
  ///
  static String getDayOfWeek(DateTime date) {
    List<String> weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return weekdays[date.weekday - 1];
  }

}