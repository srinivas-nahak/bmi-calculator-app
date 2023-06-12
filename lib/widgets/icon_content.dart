import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {this.genderIcon, this.genderType, this.iconColor, super.key});

  final IconData? genderIcon;
  final String? genderType;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 30.sp,
          color:
              iconColor, //If the iconColor is not passed then it would be white as default
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          genderType!,
          style: kTextStyle,
        ),
      ],
    );
  }
}
