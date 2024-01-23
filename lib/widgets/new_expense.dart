import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddNewExpense});

  final void Function(Expenses expenses) onAddNewExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  ExpensesCategory _selectedCategory = ExpensesCategory.food;
  DateTime? _selectDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectDate = pickedDate;
    });
  }

  void _submitNewExpenses() {
    final enteredAmount = double.tryParse(_amountController.text);
    if (_titleController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: const Text('Invalid Expense Title'),
                content: const Text('Please enter the Expense Title'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cxt);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }
    if (_amountController.text.isEmpty || enteredAmount == null || enteredAmount <= 0) {
      showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: const Text('Invalid Expense Amount'),
                content: const Text('Please enter the Valid Expense Amount'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cxt);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }
    if (_selectDate == null) {
      showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: const Text('Invalid Expense Date'),
                content: const Text('Please enter the Valid Expense Date'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cxt);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }
    widget.onAddNewExpense(Expenses(
        title: _titleController.text.toString(),
        amount: enteredAmount,
        dateTime: _selectDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text('New Expense Title',
                    style: GoogleFonts.robotoMono(fontSize: 15))),
          ),
          TextField(
            controller: _amountController,
            maxLength: 50,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixText: '\$ ',
                label: Text('New Expense Amount',
                    style: GoogleFonts.robotoMono(fontSize: 15))),
          ),
          const SizedBox(
            width: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: ExpensesCategory.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toUpperCase(),
                                style: GoogleFonts.robotoMono(fontSize: 15)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              Text(
                  _selectDate == null
                      ? 'No date selected'
                      : formatter.format(_selectDate!),
                  style: GoogleFonts.robotoMono(fontSize: 15)),
              IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month_outlined))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_outlined),
                  label: Text('Cancel',
                      style: GoogleFonts.robotoMono(fontSize: 15))),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_as_outlined),
                onPressed: _submitNewExpenses,
                label: Text('Save Expense',
                    style: GoogleFonts.robotoMono(fontSize: 15)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
