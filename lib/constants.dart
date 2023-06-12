import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//Colors
const Color kPrimaryColor = Color(0xff0a0e21);
const Color kAppBarColor = Color(0xff040911);

const Color kActiveCardColor = Color(0xff1d1e33);
const Color kInactiveCardColor = Color(0xff14172f);

const Color kPositiveTxtColor = Color(0xff43A15A);
const Color kNegativeTextColor = Color(0xffAD383F);

const Color kPrimaryTxtColor = Color(0xffDBC4CD);
const Color kSecondaryTxtColor = Color(0xff8d8e98);

const Color kInactiveTrackColor = Color(0xff404040);
const Color kActiveTrackColor = Color(0xffDBC4CD);

const Color kBottomContainerColor = Color(0xffA33E5D);

//Text Styles
TextStyle kTextStyle = TextStyle(
  color: kSecondaryTxtColor,
  fontSize: 18.sp,
);

TextStyle kBoldTextStyle = TextStyle(
    fontSize: 30.sp, color: kPrimaryTxtColor, fontWeight: FontWeight.w900);

TextStyle kSmallBoldTextStyle = TextStyle(
    fontSize: 25.sp, color: kPrimaryTxtColor, fontWeight: FontWeight.w900);

final AppBar kAppBar = AppBar(
  centerTitle: true,
  title: const Text(
    "BMI CALCULATOR",
    style: TextStyle(color: kPrimaryTxtColor, fontWeight: FontWeight.w400),
  ),
);

//Slider ThemeData

SliderThemeData getSliderThemeData(BuildContext context) =>
    SliderTheme.of(context).copyWith(
      activeTrackColor: kActiveTrackColor,
      inactiveTrackColor: kPrimaryColor.withOpacity(0.6),
      trackHeight: 2,
      thumbColor: kBottomContainerColor,
      overlayColor: kBottomContainerColor.withOpacity(0.2),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.sp),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.sp),
    );

//const Color kBottomContainerColor = Color(0xffa1434a);
