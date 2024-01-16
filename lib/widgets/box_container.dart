import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  BoxContainer({required this.myColor, this.myChild});

  Color myColor;
  Widget? myChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(10,),
      ),
      margin: EdgeInsets.all(15.0),
      height: 200,
      width: 170,
      child: myChild,
    );
  }
}
