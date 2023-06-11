import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({this.genderIcon, this.genderType, this.iconColor});

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
          size: 50,
          color:
              iconColor, //If the iconColor is not passed then it would be white as default
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderType!,
          style: kTextStyle,
        ),
      ],
    );
  }
}
