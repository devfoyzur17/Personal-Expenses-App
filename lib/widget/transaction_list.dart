// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

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
      
      height: 400,
      child: widget.transaction.isNotEmpty?ListView.builder(
         
          itemCount: widget.transaction.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
               shadowColor:  Color(0xffff80ff),
               
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
               
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(child: Text("৳ ${widget.transaction[index].amount.toString()}"))),
                  ),
                  title: Text(widget.transaction[index].title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(DateFormat.yMMMMd().format(widget.transaction[index].date)),
                    Text(DateFormat.jms().format(widget.transaction[index].date))
                  ],),
                ),
              ),
            );}):Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("No transaction added yet!!!",style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 10,),
              Container(
                height: 250,
                child: CircleAvatar(
                  radius: 105,
                   backgroundImage: AssetImage("assets/image/empty.jpg"),  
                  ),
              )
            ],
          ),
    );
  }
}
