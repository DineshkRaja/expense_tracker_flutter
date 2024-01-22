import 'package:expense_tracker/chart/Chart.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

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
        category: ExpensesCategory.work),
    Expenses(
        title: 'Randy',
        amount: 15.0,
        dateTime: DateTime.now(),
        category: ExpensesCategory.food),
    Expenses(
        title: 'CM Punk',
        amount: 100.0,
        dateTime: DateTime.now(),
        category: ExpensesCategory.leisure),
    Expenses(
        title: 'Seth',
        amount: 70.0,
        dateTime: DateTime.now(),
        category: ExpensesCategory.travel),
    Expenses(
        title: 'Cody',
        amount: 40.0,
        dateTime: DateTime.now(),
        category: ExpensesCategory.food)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (cxt) => NewExpenses(onAddNewExpense: _addExpense));
  }

  void _addExpense(Expenses expenses) {
    setState(() {
      _registeredExpenses.add(expenses);
    });
  }

  void _removeExpense(Expenses expenses) {
    final removedExpenseIndex = _registeredExpenses.indexOf(expenses);
    setState(() {
      _registeredExpenses.remove(expenses);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('${expenses.title} - ${expenses.amount} Expense deleted'),
      action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(removedExpenseIndex, expenses);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isEmpty) {
      mainContent = ExpensesList(
        expensesList: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker Flutter',
        ),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Chart(expenses: _registeredExpenses),
              Expanded(
                  child: ExpensesList(
                expensesList: _registeredExpenses,
                onRemoveExpense: _removeExpense,
              )),
            ],
          )),
    );
  }
}
