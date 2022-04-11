
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

class TransactionItem extends StatelessWidget {

  final Transaction transaction;
  final Function removeTransaction;

    TransactionItem({required this.transaction,required this.removeTransaction} );
  

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
            radius: 30,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                    child: Text(
                        "৳ ${transaction.amount.toString()}"))),
          ),
          title: Text(transaction.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd()
                  .format(transaction.date)),
              Text(transaction.time)
            ],
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () {
                    removeTransaction(
                        transaction.id);
                  },
                  label: Text("delete"), icon: Icon(Icons.delete),
                  
                  textColor: Colors.red,
                  
                 )
              : IconButton(
                  onPressed: () {
                     removeTransaction(
                         transaction.id);
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
