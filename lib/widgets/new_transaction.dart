import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

  Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    if(titleController.text.isEmpty || double.parse(amountController.text) <= 0){
      return;
    }
    widget.addTransaction(titleController.text,double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
               controller: titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
              ),
              TextButton(onPressed: (){
                    submitData();
              }, child: Text("Add Transaction",style: TextStyle(color: Colors.red),),)
            ],
          )),
    );
  }
}
