import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: BmiApp(),
    ),
  );
}
