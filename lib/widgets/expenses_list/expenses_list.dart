import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});

  final List<Expenses> expensesList;
  final void Function(Expenses expenses) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) => Dismissible(
            background: const Card(
              color: const Color.fromARGB(250,206, 147, 216),
              elevation: 3,
              shape: RoundedRectangleBorder(),
            ),
            key: ValueKey(expensesList[index]),
            onDismissed: (direction) {
              onRemoveExpense(expensesList[index]);
            },
            direction: DismissDirection.endToStart,
            child: ExpensesItem(expensesList[index])));
  }
}
