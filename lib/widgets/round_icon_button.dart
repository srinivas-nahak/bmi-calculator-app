import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.icon,
      required this.onLongPressStop,
      required this.onLongPressStart,
      super.key});

  final IconData icon;
  final void Function(PointerDownEvent) onLongPressStart;
  final void Function(PointerUpEvent) onLongPressStop;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onLongPressStart,
      onPointerUp: onLongPressStop,
      child: RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          width: 11.w,
          height: 11.h,
        ),
        onPressed: () {},
        elevation: 0,
        shape: const CircleBorder(),
        fillColor: kPrimaryColor.withOpacity(0.6),
        child: Icon(
          icon,
          color: kSecondaryTxtColor,
        ),
      ),
    );
  }
}
