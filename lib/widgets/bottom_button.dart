import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onPress, required this.btnText});

  final VoidCallback onPress;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 80,
          width: double.infinity,
          color: kBottomContainerColor,
          child: Text(
            btnText,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
