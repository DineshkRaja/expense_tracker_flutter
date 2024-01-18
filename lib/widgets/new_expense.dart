import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

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
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('New Expense Title')),
          ),
          TextField(
            controller: _amountController,
            maxLength: 50,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixText: '\$ ',
                label: Text('New Expense Amount')),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Row(
            children: [
              const Text('Select Date'),
              IconButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 1,
                                DateTime.now().month, DateTime.now().day),
                            lastDate: DateTime.now())
                        .then((value) {

                    });
                  },
                  icon: const Icon(Icons.calendar_month_outlined))
            ],
          )),
          Row(
            children: [
              FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Cancel')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_as_outlined),
                onPressed: () {
                  if (kDebugMode) {
                    print(_titleController.text);
                  }
                },
                label: const Text('Save Expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
