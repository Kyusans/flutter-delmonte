import 'package:intl/intl.dart' as intl;

class CustomDateFormat {
  String formatDate(DateTime inputDate) {
    final intl.DateFormat formatter = intl.DateFormat('MMM d, yyyy');
    return formatter.format(inputDate);
  }
}
