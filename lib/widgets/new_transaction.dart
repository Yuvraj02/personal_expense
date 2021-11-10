import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? selectedDate;

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransaction(
        titleController.text, double.parse(amountController.text),selectedDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((pickedDate) {
          if(pickedDate == null){
          return;
          }
          setState(() {
            selectedDate = pickedDate;
          });

    });
    
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
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(child: Text(selectedDate == null ? "No Date Chosen" : DateFormat.yMd().format(selectedDate!))),
                    TextButton(
                        onPressed:presentDatePicker,
                        child: Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  submitData();
                },
                child: Text(
                  "Add Transaction",
                ),
              )
            ],
          )),
    );
  }
}
