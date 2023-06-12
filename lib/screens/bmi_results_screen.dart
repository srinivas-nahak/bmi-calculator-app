import 'dart:ui';

import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/bottom_button.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class BmiResultsScreen extends StatelessWidget {
  const BmiResultsScreen(
      {required this.bmiNum,
      required this.weightStatus,
      required this.advise,
      super.key});

  final String bmiNum;
  final String weightStatus;
  final String advise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: kAppBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Your Result",
                style: kSmallBoldTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
              child: ReusableCard(
                givenColor: kActiveCardColor,
                cardChild: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          weightStatus.toUpperCase(),
                          style: TextStyle(
                            color: weightStatus == "Normal"
                                ? kPositiveTxtColor
                                : kNegativeTextColor,
                            fontSize: 23.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        bmiNum,
                        style: TextStyle(
                            color: kPrimaryTxtColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 38.sp),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "Normal BMI range:",
                        style: kTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "18.5 - 25 kg/m2",
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 13.w),
                child: Text(
                  advise,
                  style: kTextStyle.copyWith(
                      fontStyle: FontStyle.italic, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              btnText: "Re-Calculate"),
        ],
      ),
    );
  }
}
