// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfAmount;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
        height: constraints.maxHeight*0.15,

              child: FittedBox(
                  child: Text("৳${spendingAmount.toStringAsFixed(0)}"))),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.6,
            width: 10,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              )
            ]),
          ),
          SizedBox(
      height: constraints.maxHeight*0.05,

          ),
          Container(
          height: constraints.maxHeight*0.15,

            child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
