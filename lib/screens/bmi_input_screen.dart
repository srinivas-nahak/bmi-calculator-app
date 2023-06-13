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

enum ButtonType { weight, age }

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => BmiInputScreenState();
}

class BmiInputScreenState extends State<BmiInputScreen> {
  Color _maleCardColor = kActiveCardColor,
      _femaleCardColor = kActiveCardColor,
      _maleIconColor = kPrimaryTxtColor,
      _femaleIconColor = kPrimaryTxtColor;

  int _userHeight = 120,
      _userWeight = 70,
      _userAge = 19,
      _maleFlexValue = 1,
      _femaleFlexValue = 1;

  bool _isPressed = false;

  void updateColor(Gender genderType) {
    if (genderType == Gender.male) {
      //Changing All colors
      _maleCardColor = kActiveCardColor;
      _femaleCardColor = kInactiveCardColor;
      _maleIconColor = kPrimaryTxtColor;
      _femaleIconColor = kSecondaryTxtColor;

      //Changing the box size
      _maleFlexValue = 2;
      _femaleFlexValue = 1;
    } else {
      //Changing All colors
      _femaleCardColor = kActiveCardColor;
      _maleCardColor = kInactiveCardColor;
      _femaleIconColor = kPrimaryTxtColor;
      _maleIconColor = kSecondaryTxtColor;

      //Changing the box Size
      _femaleFlexValue = 2;
      _maleFlexValue = 1;
    }
  }

  void continuousClick(
      {bool increment = false, ButtonType btnType = ButtonType.weight}) async {
    _isPressed = true;

    if (increment) {
      while (_isPressed) {
        setState(() {
          //Checking the button type and incrementing the appropriate counter
          switch (btnType) {
            case ButtonType.weight:
              if (_userWeight >= 0) _userWeight++;
              break;
            case ButtonType.age:
              if (_userAge >= 0) _userAge++;
              break;
          }
        });

        //Adding delay to avoid the UI from freezing
        await Future.delayed(const Duration(milliseconds: 100));
      }
    } else {
      while (_isPressed) {
        setState(() {
          //Checking the button type and incrementing the appropriate counter
          switch (btnType) {
            case ButtonType.weight:
              if (_userWeight > 0) _userWeight--;
              break;
            case ButtonType.age:
              if (_userAge > 0) _userAge--;
              break;
          }
        });

        //Adding delay to avoid the UI from freezing
        await Future.delayed(const Duration(milliseconds: 100));
      }
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
                              flex: _maleFlexValue,
                              child: ReusableCard(
                                givenColor: _maleCardColor,
                                cardChild: IconContent(
                                    genderIcon: FontAwesomeIcons.mars,
                                    genderType: "Male",
                                    iconColor: _maleIconColor),
                                onPress: () {
                                  setState(() {
                                    updateColor(Gender.male);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: _femaleFlexValue,
                              child: ReusableCard(
                                givenColor: _femaleCardColor,
                                cardChild: IconContent(
                                  genderIcon: FontAwesomeIcons.venus,
                                  genderType: "Female",
                                  iconColor: _femaleIconColor,
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
                                  Text(_userHeight.toString(),
                                      style: kBoldTextStyle),
                                  Text("cm", style: kSmallBoldTextStyle),
                                ],
                              ),
                              Expanded(
                                flex: 2,
                                child: SliderTheme(
                                  data: getSliderThemeData(context),
                                  child: Slider(
                                    value: _userHeight.toDouble(),
                                    min: 120,
                                    max: 220,
                                    //divisions: 40,
                                    onChanged: (double value) {
                                      setState(() {
                                        _userHeight = value.round();
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
                                          _userWeight.toString(),
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
                                            onLongPressStart: (_) =>
                                                continuousClick(
                                                    btnType: ButtonType.weight),
                                            onLongPressStop: (_) => setState(
                                                () => _isPressed = false),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onLongPressStart: (_) =>
                                                continuousClick(
                                                    increment: true,
                                                    btnType: ButtonType.weight),
                                            onLongPressStop: (_) => setState(
                                                () => _isPressed = false),
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
                                          _userAge.toString(),
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
                                            onLongPressStart: (_) =>
                                                continuousClick(
                                                    btnType: ButtonType.age),
                                            onLongPressStop: (_) => setState(
                                                () => _isPressed = false),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onLongPressStart: (_) =>
                                                continuousClick(
                                                    increment: true,
                                                    btnType: ButtonType.age),
                                            onLongPressStop: (_) => setState(
                                                () => _isPressed = false),
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
    BmiBrain bmiBrain = BmiBrain(weight: _userWeight, height: _userHeight);
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
