// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

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
                                  "৳ ${widget.transaction[index].amount.toString()}"))),
                    ),
                    title: Text(widget.transaction[index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat.yMMMMd()
                            .format(widget.transaction[index].date)),
                        Text(widget.transaction[index].time)
                      ],
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: () {
                              widget.removeTransaction(
                                  widget.transaction[index].id);
                            },
                            label: Text("delete"), icon: Icon(Icons.delete),
                            
                            textColor: Colors.red,
                            
                           )
                        : IconButton(
                            onPressed: () {
                              widget.removeTransaction(
                                  widget.transaction[index].id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                  ),
                ),
              );
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
