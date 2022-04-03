// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';

import '../model/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transaction = [
    Transaction(id: "1", title: "New Books", amount: 599, date: DateTime.now()),
    Transaction(
        id: "1", title: "New Laptop", amount: 50000, date: DateTime.now()),
    Transaction(
        id: "1", title: "New Phone", amount: 14999, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 200, child: Text("Personal Expenses !!")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _transaction
                .map((transaction) => Card(
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 1.5)),
                              child: Text("\$${transaction.amount}",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  transaction.date.toString(),
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            )
                          ]),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
