import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onPress, required this.btnText, super.key});

  final VoidCallback onPress;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBottomContainerColor,
      child: InkWell(
        onTap: onPress,
        child: Center(
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            height: 8.h,
            width: double.infinity,
            child: Text(
              btnText,
              style: TextStyle(color: kPrimaryTxtColor, fontSize: 20.sp),
            ),
          ),
        ),
      ),
    );
  }
}
