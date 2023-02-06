import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/model/user.dart';

class FieldOrder {
  SportField field;
  User user;
  String selectedDate;
  List<String> selectedTime;
  bool paidStatus;
  int totalBill;

  FieldOrder(
      {required this.field,
      required this.user,
      required this.selectedDate,
      required this.selectedTime,
      required this.totalBill,
      this.paidStatus = false});
}
