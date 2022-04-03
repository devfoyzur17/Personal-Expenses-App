// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/model/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Flexible(
             
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.transaction.length,
              itemBuilder:(context, index) {
          
                return Card(
                   child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           width: 110,
                           margin: EdgeInsets.all(10),
                           padding:
                               EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                           decoration: BoxDecoration(
                               border:
                                   Border.all(color: Colors.purple, width: 1.5)),
                           child: Text(
                             "৳ ${widget.transaction[index].amount}",
                             style: TextStyle(
                                 color: Colors.purple,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 17),
                             textAlign: TextAlign.start,
                           ),
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               widget.transaction[index].title,
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16),
                             ),
                             Text(
                               DateFormat.jms().format(widget.transaction[index].date),
                               style: TextStyle(color: Colors.black54),
                             ),
                             Text(
                               DateFormat.yMMMEd().format(widget.transaction[index].date),
                               style: TextStyle(color: Colors.black54),
                             )
                           ],
                         )
                       ]),
                 );
              
            }),
          ),
        ],
      ),
    );
  }
}
