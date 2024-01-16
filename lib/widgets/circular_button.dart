import 'package:flutter/material.dart';
import 'package:theming_in_flutter/constants/constants.dart';
class CirclularButton extends StatelessWidget {
  CirclularButton({required this.myIcon, required this.onPressed});

  IconData? myIcon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    bool toCheck = Theme.of(context).brightness==Brightness.dark;
    return RawMaterialButton(
      fillColor: toCheck? activeDarkContainerColor:Colors.green[800],
      constraints: BoxConstraints.tightFor(height: 46, width: 46),
      child: Icon(myIcon),
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: 16.0,
    );
  }
}
