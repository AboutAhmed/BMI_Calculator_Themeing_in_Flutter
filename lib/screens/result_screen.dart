import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/bottomButton.dart';
import '../widgets/box_container.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({this.bmi, this.bmiText, this.bmiInterpretation});

  double? bmi;
  String? bmiText;
  String? bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    bool toCheck = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Center(child: Text("Your BMI is",
            style:TextStyle(
              fontSize: 25,
            ) ,))),
          Expanded(
            flex: 5,
            child: BoxContainer(
              myColor: Colors.greenAccent,
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText.toString(),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(bmi!.toStringAsFixed(1), style: KnumberStyle),
                  Text(
                    bmiInterpretation.toString(),textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            color: toCheck ? Color(0xFFEB1555) : Colors.green[800],
            child: BottomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              btnText: "Re-Calculate",
            ),
          ),
        ],
      ),
    );
  }
}
