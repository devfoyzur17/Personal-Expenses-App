// ignore_for_file: prefer_const_constructors

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
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: _nameController,
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
          TextField(
            controller: _amountController,
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
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.purple,
                  side: BorderSide(
                    color: Colors.purple,
                    width: 2,
                  )),
              onPressed: () {
                widget.addNewTransaction(_nameController.text, double.parse(_amountController.text));
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
