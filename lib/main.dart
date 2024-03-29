// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'Helper/logicfunctions.dart';
import 'Pages/Home.dart';

void main(List<String> args) async {

  // Initialize the Hive
  await Hive.initFlutter();

  // Create A Hive box
  // ignore: unused_local_variable
  var mybox = await Hive.openBox("taskBox");
  log('Main File');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Logicfuncs()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
      ),
    ),
  );
}
