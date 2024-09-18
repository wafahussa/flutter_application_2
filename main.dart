// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home.dart';
import 'package:flutter_application_2/Map.dart';
import 'package:flutter_application_2/SplachScreen.dart';
import 'package:flutter_application_2/Start.dart';
import 'package:flutter_application_2/faltara.dart';
import 'package:flutter_application_2/listofreports.dart';
import 'package:flutter_application_2/login.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_collection_literals
      home: Home(),
      routes: {
        'SplashScreen': (context) => SplashScreen(),
        'Start': (context) => Start(),
        'login': (context) => Login(),
        'Home': (context) => Home(),
        'Listofreports': (context) => Listofreports(),
        'Map': (context) => MapL(),
        //'Homeeee': (context) => Homeeee(),
        'TicketManagement': (context) => TicketManagement(),
      },
    );
  }
}
