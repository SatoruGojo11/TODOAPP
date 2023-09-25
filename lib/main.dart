// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Pages/Home.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ),
  );
}
