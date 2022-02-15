import 'package:intl/intl.dart';

class DateFormatHelper {
  static DateFormat _yearMonthDay = new DateFormat('yyyy-MM-ddT');
  static DateFormat _serverFormat = new DateFormat('y-MMMM-dTHmsZ');
  static DateFormat _weekDayMonth = new DateFormat('EEEE - d MMMM');
  static DateFormat _hour24MinuteSecond = new DateFormat('HH:mm:ss');
  static DateFormat _hourMinuteSecond = new DateFormat('jm');
  static DateFormat yearMonthDayServer = new DateFormat('d-MMMM-y ');
  static DateFormat serverFormatApi =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  static DateFormat _yearMonth = new DateFormat('d MMM');
  static String yearMonthDay(String date) {
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _yearMonthDay.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static int getTimezoneOffset() {
    var d = DateTime.now().timeZoneOffset.inMinutes;
    print(d);
    return d;
  }

  static String datemounthYear(int date) {
    final df = new DateFormat.yMMMd();
    var formattedDate =
        df.format(new DateTime.fromMillisecondsSinceEpoch(date * 1000));

    return formattedDate;
  }

  static String dayMount(String date) {
    var formattedDate = _serverFormat.format(DateTime.parse(date));

    return formattedDate;
  }

  static String weekDayMonth(String date) {
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _weekDayMonth.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String hour24MinuteSecond(String date) {
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _hour24MinuteSecond.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String addDateTime(String date, String time) {
    // ignore: unnecessary_null_comparison
    if (date != null && time != null) {
      var dateTime = date + time;
      var formattedDate = apiFormatYearMonthDayServer(dateTime.toString());
      return formattedDate;
    } else {
      return '';
    }
  }

  static String yearMonth(String date) {
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _yearMonth.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String hourMinuteSecond(DateTime date) {
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _hourMinuteSecond.format(date);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String formatYearMonthDayServer(String date) {
    //24/08/2021
    if (date.isNotEmpty) {
      var formattedDate = yearMonthDayServer.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String hourMinuteSecondS(String date) {
    //12 PM
    // ignore: unnecessary_null_comparison
    if (date != null) {
      var formattedDate = _hourMinuteSecond.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  static String apiFormatYearMonthDayServer(String date) {
    if (date.isNotEmpty) {
      var formattedDate = serverFormatApi.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }

  static String formatYearMonthDayTimeServer(String date) {
    if (date.isNotEmpty) {
      var formattedDate = yearMonthDayServer.format(DateTime.parse(date));
      return formattedDate;
    } else {
      return '';
    }
  }
}
