import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.givenColor, this.cardChild, this.onPress});

  final Color givenColor;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: givenColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      ),
    );
  }
}
