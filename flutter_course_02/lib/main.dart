import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/new _transaction.dart';
import 'widgets/transaction_list.dart';

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
        primarySwatch: Colors.amber,
        secondaryHeaderColor: Colors.red,
        textTheme: const TextTheme(
            labelMedium: TextStyle(
          fontSize: 25,
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'new shoes',
    //   amount: 89.9,
    //   date: DateTime.now(),
    // ),
  ];

  addTransaction(String title, double amount) {
    setState(() {
      transactions.add(
        Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
  }

  void startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addTransaction: addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test1',
        ),
        actions: [
          IconButton(
              onPressed: () {
                startAddTransaction(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 5),
            gradient: const LinearGradient(
              colors: [Color(0xFFfbab66), Color(0xFFf7418c)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: SingleChildScrollView(
          child: Column(
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
              TransactionList(
                transactions: transactions,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
