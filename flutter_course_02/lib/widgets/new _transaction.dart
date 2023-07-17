import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({super.key, required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
