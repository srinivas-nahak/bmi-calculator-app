import 'package:flutter/material.dart';

const Color kActiveCardColor = Color(0xff1d1e33);
const Color kInactiveCardColor = Color(0xff14172f);
const Color kBottomContainerColor = Color(0xffeb1555);
const Color kMainTxtColor = Color(0xff8d8e98);
const TextStyle kTextStyle = TextStyle(
  color: kMainTxtColor,
  fontSize: 18,
);

const TextStyle kBoldTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

const TextStyle kSmallBoldTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w900);

final AppBar kAppBar = AppBar(
  title: Center(
    child: Text(
      "BMI CALCULATOR",
    ),
  ),
);
