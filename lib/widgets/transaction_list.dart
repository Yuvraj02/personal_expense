import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {

  List<Transaction> transactions;
  Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
      child: transactions.isEmpty ? Container(child: Center(child: Text("No Transactions Added Yet!")),):ListView.builder(
        itemBuilder: (context,index){
          // return Card(
          //     child: Row(
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.all(10),
          //           margin: const EdgeInsets.symmetric(
          //               vertical: 10, horizontal: 15),
          //           child: Text("₹${transactions[index].amount.toStringAsFixed(2)}",
          //               style: TextStyle(
          //                   color: Theme.of(context).primaryColor,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 20)),
          //           decoration: BoxDecoration(
          //               border: Border.all(
          //                   color: Theme.of(context).primaryColor, width: 2)),
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               transactions[index].title,
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold, fontSize: 16),
          //             ),
          //             Text(DateFormat().format(transactions[index].date),
          //                 style: TextStyle(color: Colors.grey))
          //           ],
          //         )
          //       ],
          //     ));

          return Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(radius: 30,child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(child: Text("₹${transactions[index].amount.toStringAsFixed(2)}")),
              )),
              title: Text(transactions[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(icon:Icon(Icons.delete,color: Theme.of(context).errorColor),onPressed: (){deleteTx(transactions[index].id);},),
            ),
          );

        },
        itemCount: transactions.length,
        ),
      );
  }
}
