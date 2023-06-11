import 'package:bmi_calculator/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/round_icon_button.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../widgets/bottom_button.dart';

enum Gender { male, female }

class BmiApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BmiAppState();
}

class BmiAppState extends State<BmiApp> {
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  Color maleIconColor = Colors.white;
  Color femaleIconColor = Colors.white;

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
      maleIconColor = Colors.white;
      femaleIconColor = kMainTxtColor;

      //Changing the box size
      maleFlexValue = 2;
      femaleFlexValue = 1;
    } else {
      //Changing All colors
      femaleCardColor = kActiveCardColor;
      maleCardColor = kInactiveCardColor;
      femaleIconColor = Colors.white;
      maleIconColor = kMainTxtColor;

      //Changing the box Size
      femaleFlexValue = 2;
      maleFlexValue = 1;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: kAppBar,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                          givenColor: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Height",
                                style: kTextStyle,
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
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Color(0xff404040),
                                  trackHeight: 1,
                                  thumbColor: kBottomContainerColor,
                                  overlayColor:
                                      kBottomContainerColor.withOpacity(0.2),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 12),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 25),
                                ),
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
                                givenColor: kActiveCardColor,
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Weight",
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      userWeight.toString(),
                                      style: kBoldTextStyle,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RoundIconButton(
                                          icon: Icons.remove,
                                          onPressed: () {
                                            setState(() {
                                              if (userWeight > 0) userWeight--;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        RoundIconButton(
                                          icon: Icons.add,
                                          onPressed: () {
                                            setState(() {
                                              if (userWeight >= 0) userWeight++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReusableCard(
                                givenColor: kActiveCardColor,
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age",
                                      style: kTextStyle,
                                    ),
                                    Text(
                                      userAge.toString(),
                                      style: kBoldTextStyle,
                                    ),
                                    Row(
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
                                          width: 10,
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
              BottomButton(
                  onPress: () {
                    BmiBrain bmiBrain =
                        BmiBrain(weight: userWeight, height: userHeight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultsPage(
                            weightStatus: bmiBrain.getAdvise()["weightStatus"]!,
                            bmiNum: bmiBrain.getBMI(),
                            advise: bmiBrain.getAdvise()["advise"]!,
                          );
                        },
                      ),
                    );
                  },
                  btnText: "Calculate"),
            ],
          ),
        ),
      );
}
