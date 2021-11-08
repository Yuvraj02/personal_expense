import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widgets/new_transaction.dart';
import 'package:personal_expense/widgets/transaction_list.dart';
import 'package:personal_expense/widgets/user_transactions.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  String? titleInput;
  String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expense"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: const Card(
                  child: Text(
                    "Chart",
                  ),
                  color: Colors.blue)),
          UserTransaction(),
        ],
      ),
    );
  }
}
