import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({super.key, required this.addTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    // used to close the bottom sheet or top most screen.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              // onChanged: (value) {
              //   titelInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitData(),
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              // onChanged: (value) => {amountInput = value},
            ),
            ElevatedButton(
                onPressed: submitData, child: const Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
