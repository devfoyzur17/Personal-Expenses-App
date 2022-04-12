// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function removeTransaction;

  TransactionItem({
     
    required this.transaction, required this.removeTransaction, required ValueKey<String> Key}): super(key: Key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _backgroundColor;
  @override
  void initState() {
    // TODO: implement initState

    const avaibleColor = [
      Colors.deepOrange,
      Colors.green,
      Colors.purple,
      Colors.blue
    ];

    _backgroundColor = avaibleColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Color(0xffff80ff),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                    child: Text("৳ ${widget.transaction.amount.toString()}"))),
          ),
          title: Text(widget.transaction.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(widget.transaction.date)),
              Text(widget.transaction.time)
            ],
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () {
                    widget.removeTransaction(widget.transaction.id);
                  },
                  label: Text("delete"),
                  icon: Icon(Icons.delete),
                  textColor: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    widget.removeTransaction(widget.transaction.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
        ),
      ),
    );
  }
}
