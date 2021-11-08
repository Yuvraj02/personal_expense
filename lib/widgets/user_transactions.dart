import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:personal_expense/widgets/new_transaction.dart';
import 'package:personal_expense/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {


  final List<Transaction> transactions = [Transaction(id: "t1", title: "Food", amount: 159.99, date: DateTime.now()),
    Transaction(
        title: "Football Jersey",
        id: "t2",
        amount: 999.99,
        date: DateTime.now())];

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [NewTransaction(),
       TransactionList(transactions),],
    );
  }
}
