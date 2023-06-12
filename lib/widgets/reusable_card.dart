import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {this.givenColor = kActiveCardColor,
      this.cardChild,
      this.onPress,
      super.key});

  final Color givenColor;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 3.w),
        decoration: BoxDecoration(
          color: givenColor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: cardChild,
      ),
    );
  }
}
