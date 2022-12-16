import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransactions(this.addTx);

  void submitData() {
    final enteredtitle = titleController.text;
    final enteredAmmount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredAmmount <= 0) {
      return;
    }
    addTx(
      enteredtitle,
      enteredAmmount,
    );
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
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
