import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenses, {super.key});

  final Expenses expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Text(expenses.title, style: GoogleFonts.robotoMono(fontSize: 17)),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoMono(fontSize: 13)),
                const Spacer(),
                Row(children: [
                  Icon(categoryIcons[expenses.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expenses.formattedDate,
                      style: GoogleFonts.robotoMono(fontSize: 13))
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
