import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMMMd();

enum ExpensesCategory { travel, food, leisure, work }

const categoryIcons = {
  ExpensesCategory.travel: Icons.flight_takeoff,
  ExpensesCategory.food: Icons.lunch_dining,
  ExpensesCategory.leisure: Icons.movie,
  ExpensesCategory.work: Icons.work
};

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
  final ExpensesCategory category;

  String get formattedDate {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.expensesCategory,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expenses> allExpenses, this.expensesCategory)
      : expenses = allExpenses
            .where((expense) => expense.category == expensesCategory)
            .toList();

  final ExpensesCategory expensesCategory;
  final List<Expenses> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount; //sum = sum + expense.amount
    }
    return sum;
  }
}
