// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widget/chart.dart';
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
    // Transaction(id: "1", title: "Books", amount: 599, date: DateTime.now()),
    // Transaction(id: "1", title: "Laptop", amount: 50000, date: DateTime.now()),
    // Transaction(id: "1", title: "Phone", amount: 14999, date: DateTime.now()),
  ];

  List<Transaction> get  _recentTransaction{
    return _transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }
    ).toList();
  }

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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTransaction(_addNewTransaction),
           // behavior: HitTestBehavior.opaque,
            );
            
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2, 
        title: Text("Personal Expenses List!"),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Chart(_recentTransaction),
          //   NewTransaction(_addNewTransaction),
          TransactionList(_transaction)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
