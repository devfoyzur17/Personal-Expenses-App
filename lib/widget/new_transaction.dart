// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  void submittedData() {
    final enterNameController = _nameController.text;
    final enterAmountController = double.parse(_amountController.text);

    if (enterNameController.isEmpty || enterAmountController <= 0) {
      return;
    } else {
      widget.addNewTransaction(
          _nameController.text, double.parse(_amountController.text));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
// this is amount textfield

          TextField(
            controller: _nameController,
            keyboardType: TextInputType.name,
          onSubmitted: (_) => submittedData(),
            decoration: InputDecoration(
                labelText: "Name",
                hintText: "enter your cost name.",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffff00ff))),
                labelStyle: TextStyle(color: Colors.purple),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
          SizedBox(
            height: 20,
          ),

// This is amount text field

          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
           onSubmitted: (_) => submittedData(),
            decoration: InputDecoration(
                labelText: "Amount",
                hintText: "enter the cost name.",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffff00ff))),
                labelStyle: TextStyle(color: Colors.purple),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
          SizedBox(
            height: 10,
          ),

// this is add transaction button

          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.purple,
                  side: BorderSide(
                    color: Colors.purple,
                    width: 2,
                  )),
              onPressed: () {
                submittedData();
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
