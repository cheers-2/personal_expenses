import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTranasction;

  const AddTransaction(this.addNewTranasction, {Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTranasction(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title Transaction'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: submitData,
                child: const Text('Add Transaction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
