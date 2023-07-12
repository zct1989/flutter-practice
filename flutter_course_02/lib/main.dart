import 'package:flutter/material.dart';
import 'package:flutter_course_02/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 89.9, date: DateTime.now()),
    Transaction(id: 't2', title: 'new box', amount: 19.9, date: DateTime.now()),
    Transaction(id: 't3', title: 'new eggs', amount: 9.9, date: DateTime.now()),
  ];

  String titleInput = "";
  String amountInput = "";

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test1'),
        ),
        body: Column(
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
            Card(
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
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: const Text('Add Transaction'),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            tx.amount.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${tx.amount}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(DateFormat.yMMMd().format(tx.date))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
