import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:personal_expense/widgets/user_transactions.dart';

class TransactionList extends StatelessWidget {

  List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: transactions.map((tx) {
        return Card(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  child: Text("₹${tx.amount.toString()}",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.deepPurpleAccent, width: 2)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(DateFormat().format(tx.date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ));
      }).toList(),
    );
  }
}
