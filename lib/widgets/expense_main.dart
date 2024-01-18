import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'new_expense.dart';

class ExpenseMain extends StatefulWidget {
  const ExpenseMain({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<ExpenseMain> {
  final List<Expenses> _registeredExpenses = [
    Expenses(
        title: 'Roman',
        amount: 10.0,
        dateTime: DateTime.now(),
        category: Category.work),
    Expenses(
        title: 'Randy',
        amount: 15.0,
        dateTime: DateTime.now(),
        category: Category.food),
    Expenses(
        title: 'CM Punk',
        amount: 100.0,
        dateTime: DateTime.now(),
        category: Category.leisure),
    Expenses(
        title: 'Seth',
        amount: 70.0,
        dateTime: DateTime.now(),
        category: Category.travel),
    Expenses(
        title: 'Cody',
        amount: 40.0,
        dateTime: DateTime.now(),
        category: Category.food)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (cxt) {
      return const NewExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker Flutter',
          style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Text(
            'chart',
            style: GoogleFonts.robotoMono(fontSize: 20),
          ),
          Expanded(child: ExpensesList(expensesList: _registeredExpenses)),
        ],
      ),
    );
  }
}
