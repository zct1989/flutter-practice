import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new _transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new shoes',
      amount: 89.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new box',
      amount: 19.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'new eggs',
      amount: 9.9,
      date: DateTime.now(),
    ),
  ];

  addTransaction(String title, double number) {
    _userTransaction.add(
      Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: number,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Card(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: Colors.blue,
          child: SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Text('CHART1!'),
            ),
          ),
        ),
        NewTransaction(
          addTransaction: addTransaction,
        ),
        TransactionList(
          transactions: _userTransaction,
        ),
      ],
    );
  }
}
