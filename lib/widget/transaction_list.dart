// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

import 'transaction_item.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transaction;
  final Function removeTransaction;

  TransactionList(this.transaction, this.removeTransaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transaction.isNotEmpty
        ? ListView.builder(
           
            itemCount: widget.transaction.length,
            itemBuilder: (context, index) {
              return TransactionItem(transaction: widget.transaction[index],removeTransaction: widget.removeTransaction);
            })
        : LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No transaction added yet!!!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage("assets/image/empty.jpg"),
                  ),
                )
              ],
            );
          });
  }
}
