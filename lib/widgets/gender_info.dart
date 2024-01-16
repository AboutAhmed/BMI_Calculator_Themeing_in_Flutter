import 'package:flutter/material.dart';

class Gender_info extends StatelessWidget {
  Gender_info({this.genderLabel, this.genderIcon});
  String? genderLabel;
  IconData? genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Text(genderLabel!),
      ],
    );
  }
}