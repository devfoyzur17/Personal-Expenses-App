// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widget/new_transaction.dart';
import 'package:personal_expenses_app/widget/transaction_list.dart';
import '../model/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  final List<Transaction> _transaction = [
    Transaction(id: "1", title: "Books", amount: 599, date: DateTime.now()),
    Transaction(id: "1", title: "Laptop", amount: 50000, date: DateTime.now()),
    Transaction(id: "1", title: "Phone", amount: 14999, date: DateTime.now()),
  ];

  void _addNewTransaction(String name, double amount) {
    final newTransaction = Transaction(
        id: DateFormat.NUM_MONTH_DAY.toString(),
        title: name,
        amount: amount,
        date: DateTime.now());

        setState(() {
          _transaction.add(newTransaction);
        });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Personal Expenses !!"),
              NewTransaction(_addNewTransaction),
              TransactionList(_transaction)
            ],
          ),
        ),
      ),
    );
  }
}
