// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, unused_element, unnecessary_null_comparison, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
   String? _selectedTime;

  void submittedData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterNameController = _nameController.text;
    final enterAmountController = double.parse(_amountController.text);

    if (enterNameController.isEmpty ||
        enterAmountController <= 0 ||
        _selectedDate == null) {
      return;
    } else {
      widget.addNewTransaction(_nameController.text,
          double.parse(_amountController.text), _selectedDate,_selectedTime);
    }

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

 

  void _PresentTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((result) {
          if (result == null) {
            return;
          }else{
             setState(() {
               _selectedTime=result.format(context);
             });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
// this is amount textfield

          TextField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            onSubmitted: (_) => submittedData(),
            decoration: InputDecoration(
                labelText: "Name",
                hintText: "enter your cost name.",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffff00ff))),
                labelStyle: TextStyle(color: Colors.purple),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
          SizedBox(
            height: 20,
          ),

// This is amount text field

          TextField(
             
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submittedData(),
            decoration: InputDecoration(
                labelText: "Amount",
                hintText: "enter the cost name.",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xffff00ff))),
                labelStyle: TextStyle(color: Colors.purple),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            height: 40,
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _selectedDate == null
                          ? "No date choisen!!"
                          : DateFormat.yMMMd().format(_selectedDate!),
                      style: TextStyle(
                          color: _selectedDate == null
                              ? Colors.red
                              : Colors.purple,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      "Choise date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedDate == null
                              ? Colors.red
                              : Colors.purple),
                    ))
              ],
            ),
          ),

          Container(
            height: 40,
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _selectedTime == null
                          ? "No time choisen!!"
                          : _selectedTime.toString(),
                      style: TextStyle(
                          color: _selectedTime == null
                              ? Colors.red
                              : Colors.purple,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      _PresentTimePicker();
                    },
                    child: Text(
                      "Choise time",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedTime == null
                              ? Colors.red
                              : Colors.purple),
                    ))
              ],
            ),
          ),

// this is add transaction button

          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.purple,
                  side: BorderSide(
                    color: Colors.purple,
                    width: 2,
                  )),
              onPressed: () {
                submittedData();
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
