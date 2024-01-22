import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenses, {super.key});

  final Expenses expenses;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expenses.title,
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text('\$${expenses.amount.toStringAsFixed(2)}',
                      style: GoogleFonts.robotoMono(
                          fontSize: 13, color: Colors.white)),
                  const Spacer(),
                  Row(children: [
                    Icon(
                      categoryIcons[expenses.category],
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenses.formattedDate,
                        style: GoogleFonts.robotoMono(
                            fontSize: 13, color: Colors.white))
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
