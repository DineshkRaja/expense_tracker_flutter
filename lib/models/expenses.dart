import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMMMd();

enum Category { travel, food, leisure, work }

const categoryIcons = {
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};


class Expenses {
  Expenses({required this.title,
    required this.amount,
    required this.dateTime,
    required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;

  String get formattedDate {
    return formatter.format(dateTime);
  }

}
