import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});

  final List<Expenses> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) =>
        ExpensesItem(expensesList[index])
    );
  }
}
