// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, unused_element, sized_box_for_whitespace

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
  int id = 0;

  final List<Transaction> _transaction = [];

  List<Transaction> get _recentTransaction {
    return _transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String name, double amount, DateTime choisenDate, String choisenTime) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: name,
        amount: amount,
        date: choisenDate,
        time: choisenTime);

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            // behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
        elevation: 2,
        title: Text("Personal Expenses List!"),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              height: (MediaQuery.of(context).size.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(_recentTransaction)),
              
            //   NewTransaction(_addNewTransaction),
            Container(
              height: (MediaQuery.of(context).size.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top)*0.7,
              child: TransactionList(_transaction, _removeTransaction))
          ],
        ),
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
