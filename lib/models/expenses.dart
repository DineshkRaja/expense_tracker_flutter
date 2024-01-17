import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { travel, food, leisure, work }

class Expenses {
  Expenses(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
}
