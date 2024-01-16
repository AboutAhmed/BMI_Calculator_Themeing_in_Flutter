import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onPressed, required this.btnText});

  void Function()? onPressed;
  String? btnText;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.expand(),
      onPressed: onPressed,
      child: Text(btnText!),
    );
  }
}
