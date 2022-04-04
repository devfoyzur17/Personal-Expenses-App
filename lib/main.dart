// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}
 
 class MyApp extends StatefulWidget {
   const MyApp({ Key? key }) : super(key: key);
 
   @override
   State<MyApp> createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "Personal Expenses!",
       theme: ThemeData(
         primarySwatch: Colors.purple,
        
       ),
       home: HomePage(),
     );
   }
 }