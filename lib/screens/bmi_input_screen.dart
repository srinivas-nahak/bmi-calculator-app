import 'package:bmi_calculator/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/round_icon_button.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants.dart';
import 'bmi_results_screen.dart';
import '../widgets/bottom_button.dart';

enum Gender { male, female }

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<StatefulWidget> createState() => BmiInputScreenState();
}

class BmiInputScreenState extends State<BmiInputScreen> {
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  Color maleIconColor = kPrimaryTxtColor;
  Color femaleIconColor = kPrimaryTxtColor;

  int userHeight = 120;
  int userWeight = 80;
  int userAge = 19;
  int maleFlexValue = 1;
  int femaleFlexValue = 1;

  void updateColor(Gender genderType) {
    if (genderType == Gender.male) {
      //Changing All colors
      maleCardColor = kActiveCardColor;
      femaleCardColor = kInactiveCardColor;
      maleIconColor = kPrimaryTxtColor;
      femaleIconColor = kSecondaryTxtColor;

      //Changing the box size
      maleFlexValue = 2;
      femaleFlexValue = 1;
    } else {
      //Changing All colors
      femaleCardColor = kActiveCardColor;
      maleCardColor = kInactiveCardColor;
      femaleIconColor = kPrimaryTxtColor;
      maleIconColor = kSecondaryTxtColor;

      //Changing the box Size
      femaleFlexValue = 2;
      maleFlexValue = 1;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //appBar: kAppBar,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: maleFlexValue,
                              child: ReusableCard(
                                givenColor: maleCardColor,
                                cardChild: IconContent(
                                    genderIcon: FontAwesomeIcons.mars,
                                    genderType: "Male",
                                    iconColor: maleIconColor),
                                onPress: () {
                                  setState(() {
                                    updateColor(Gender.male);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: femaleFlexValue,
                              child: ReusableCard(
                                givenColor: femaleCardColor,
                                cardChild: IconContent(
                                  genderIcon: FontAwesomeIcons.venus,
                                  genderType: "Female",
                                  iconColor: femaleIconColor,
                                ),
                                onPress: () {
                                  setState(() {
                                    updateColor(Gender.female);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ), //Gender Type
                      Expanded(
                        flex: 1,
                        child: ReusableCard(
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(flex: 1, child: SizedBox()),
                              Text(
                                "Height",
                                style: kTextStyle,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(userHeight.toString(),
                                      style: kBoldTextStyle),
                                  Text("cm", style: kSmallBoldTextStyle),
                                ],
                              ),
                              Expanded(
                                flex: 2,
                                child: SliderTheme(
                                  data: getSliderThemeData(context),
                                  child: Slider(
                                    value: userHeight.toDouble(),
                                    min: 120,
                                    max: 220,
                                    //divisions: 40,
                                    onChanged: (double value) {
                                      setState(() {
                                        userHeight = value.round();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Expanded(flex: 1, child: SizedBox())
                            ],
                          ),
                        ),
                      ), //Height Slider
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: ReusableCard(
                                cardChild: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 2.5.h,
                                    ),
                                    Text(
                                      "Weight",
                                      style: kTextStyle,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          userWeight.toString(),
                                          style: kBoldTextStyle,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPressed: () {
                                              setState(() {
                                                if (userWeight > 0) {
                                                  userWeight--;
                                                }
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPressed: () {
                                              setState(() {
                                                if (userWeight >= 0) {
                                                  userWeight++;
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReusableCard(
                                cardChild: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.5.h,
                                    ),
                                    Text(
                                      "Age",
                                      style: kTextStyle,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          userAge.toString(),
                                          style: kBoldTextStyle,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPressed: () {
                                              setState(() {
                                                if (userAge > 0) userAge--;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPressed: () {
                                              setState(() {
                                                if (userAge >= 0) userAge++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //Age and Weight
                    ],
                  ),
                ),
              ),
              BottomButton(onPress: _showResults, btnText: "Calculate"),
            ],
          ),
        ),
      );

  void _showResults() {
    BmiBrain bmiBrain = BmiBrain(weight: userWeight, height: userHeight);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BmiResultsScreen(
            weightStatus: bmiBrain.getAdvise()["weightStatus"]!,
            bmiNum: bmiBrain.getBMI(),
            advise: bmiBrain.getAdvise()["advise"]!,
          );
        },
      ),
    );
  }
}

// Expanded(
// child: ReusableCard(
// cardChild: Column(
// children: [
// SizedBox(
// height: 1.h,
// ),
// Expanded(
// child: Center(
// child: Text(
// "Weight",
// style: kTextStyle,
// ),
// ),
// ),
// Expanded(
// child: Text(
// userWeight.toString(),
// style: kBoldTextStyle,
// ),
// ),
// Expanded(
// flex: 2,
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// RoundIconButton(
// icon: Icons.remove,
// onPressed: () {
// setState(() {
// if (userWeight > 0) {
// userWeight--;
// }
// });
// },
// ),
// SizedBox(
// width: 3.w,
// ),
// RoundIconButton(
// icon: Icons.add,
// onPressed: () {
// setState(() {
// if (userWeight >= 0) {
// userWeight++;
// }
// });
// },
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// )
