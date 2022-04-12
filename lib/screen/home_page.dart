// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
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
  bool _showChart = false;
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

  List<Widget> _buildLandscapeContenr(mediaQuery, appBar, txtListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Show chart",
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          Switch(
              value: _showChart,
              onChanged: (value) {
                setState(() {
                  _showChart = value;
                });
              })
        ],
      ),
      _showChart
          ? Container(
              alignment: Alignment.center,
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransaction))
          : Text(""),
      txtListWidget
    ];
  }

  List<Widget> _buildPortraintContant(
      MediaQueryData mediaQuery, AppBar appbar, Container txListWidget) {
    return [
      Container(
          alignment: Alignment.center,
          height: (mediaQuery.size.height -
                  appbar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: Chart(_recentTransaction)),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    final _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
    final txListWidget = Container(
        height: (_mediaQuery.size.height -
                appbar.preferredSize.height -
                _mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_transaction, _removeTransaction));
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isLandscape)
              ..._buildLandscapeContenr(_mediaQuery, appbar, txListWidget),

            if (!_isLandscape)
              ..._buildPortraintContant(_mediaQuery, appbar, txListWidget),

            //   NewTransaction(_addNewTransaction),
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
