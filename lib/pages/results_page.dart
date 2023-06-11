import 'dart:ui';

import 'package:bmi_calculator/widgets/reusable_card.dart';
import '../widgets/bottom_button.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
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
      appBar: kAppBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: SizedBox(
              height: 30,
            ),
          ),
          Expanded(
            flex: 0,
            child: Center(
              child: Text(
                "Your Result",
                style: kSmallBoldTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReusableCard(
                givenColor: kActiveCardColor,
                cardChild: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        weightStatus.toUpperCase(),
                        style: TextStyle(
                          color: weightStatus == "Normal"
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        bmiNum,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 95),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "Normal BMI range:",
                        style: kTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        "18.5 - 25 kg/m2",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          advise,
                          style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
