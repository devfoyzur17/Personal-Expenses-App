// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/screen/home_page.dart';
import 'package:flutter/services.dart';
void main() {

  // WidgetsFlutterBinding.ensureInitialized();
 
  // SystemChrome.setPreferredOrientations(
  //    [
  //      DeviceOrientation.portraitDown,
  //      DeviceOrientation.portraitUp,
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight
  //    ]

  // );
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
          
          
          fontFamily: 'Quicksand',
          //shadowColor: Color(0xffff80ff),
          cardTheme: CardTheme(shadowColor: Color(0xffff80ff)),
           
           
          textTheme: TextTheme(
            titleMedium: TextStyle(
                color: Colors.black,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold),
 

          ),
          appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontFamily: 'OpneSans',
                fontWeight: FontWeight.bold,
              ))),
      home: HomePage(),
    );
  }
}
