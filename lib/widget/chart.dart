// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable, unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widget/chart_bar.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }

         

        return {"day": DateFormat.E().format(weekDay),
         "amount": totalSum};
      },
    ).reversed.toList();
  }

  
  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Card(
      
      elevation: 15,
      shadowColor:  Color(0xffff80ff),
        
      margin: EdgeInsets.only(top: 29, left: 20, right: 20,bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar( data['day'],  data['amount'], 
              totalSpending ==0?0.0:(data['amount'] as double)/totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
