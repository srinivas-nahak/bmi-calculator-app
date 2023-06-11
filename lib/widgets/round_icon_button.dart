import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      onPressed: onPressed,
      elevation: 0,
      child: Icon(icon),
      shape: const CircleBorder(),
      fillColor: const Color(0xff404040),
    );
  }
}
