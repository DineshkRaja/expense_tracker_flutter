import 'package:flutter/material.dart';

import 'models/expenses.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _registeredExpenses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Center(child: Text('Entry ${_registeredExpenses[index]}')),
                );
              }
          )
        ],
      ),
    );
  }
}
