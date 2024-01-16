import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theming_in_flutter/calculator.dart';
import 'package:theming_in_flutter/screens/result_screen.dart';

import '../constants/constants.dart';
import '../theming_app/theme_consrants.dart';

import '../theming_app/theme_manager.dart';
import '../widgets/bottomButton.dart';
import '../widgets/box_container.dart';
import '../widgets/circular_button.dart';
import '../widgets/gender_info.dart';

ThemeManager _themeManager = ThemeManager();

// Color maleLightContainerColor = inActiveLightContainerColor;
// Color maleDarkContainerColor = inActiveDarkContainerColor;

Gender? selectedGender;

enum Gender { male, female }

Color activeColor(bool checkTheme) {
  Color active =
      checkTheme ? activeDarkContainerColor : activeLightContainerColor;
  return active;
}

Color inActiveColor(bool checkTheme) {
  Color inActive =
      checkTheme ? inActiveDarkContainerColor : inActiveLightContainerColor;
  return inActive;
}

//
// selectionColor(int gender){
//
//   if(gender == 1){
//     if(maleLightContainerColor  == inActiveLightContainerColor ||maleDarkContainerColor  == inActiveDarkContainerColor){
//       maleLightContainerColor = activeLightContainerColor;
//       maleDarkContainerColor = activeDarkContainerColor;
//
//       FemaleLightContainerColor = inActiveLightContainerColor;
//       FemaleDarkContainerColor = inActiveDarkContainerColor;
//     }else{
//       maleLightContainerColor = inActiveLightContainerColor;
//       maleDarkContainerColor = inActiveDarkContainerColor;
//     }
//   }
//   if(gender == 2){
//     if(FemaleLightContainerColor  == inActiveLightContainerColor || FemaleDarkContainerColor  == inActiveDarkContainerColor){
//       FemaleLightContainerColor = activeLightContainerColor;
//       FemaleDarkContainerColor = activeDarkContainerColor;
//
//       //For UnACtive Color
//       maleLightContainerColor = inActiveLightContainerColor;
//       maleDarkContainerColor = inActiveDarkContainerColor;
//     }else{
//       FemaleLightContainerColor = inActiveLightContainerColor;
//       FemaleDarkContainerColor =  inActiveDarkContainerColor;
//     }
//   }
// }

class MyTheme extends StatefulWidget {
  const MyTheme({Key? key}) : super(key: key);

  @override
  State<MyTheme> createState() => _MyThemeState();
}

class _MyThemeState extends State<MyTheme> {
  @override
  initState() {
    _themeManager.addListener(themeChange);
    super.initState();
  }

  dispose() {
    _themeManager.removeListener(themeChange);
    super.dispose();
    print("Disposef");
  }

  themeChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: MyThemeApp(),
    );
  }
}

class MyThemeApp extends StatefulWidget {
  const MyThemeApp({Key? key}) : super(key: key);

  @override
  State<MyThemeApp> createState() => _MyThemeAppState();
}

class _MyThemeAppState extends State<MyThemeApp> {
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool toCheck = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (value1) {
                _themeManager.toggleTheme(value1);
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  ///TODO gender selection
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: BoxContainer(
                      myChild: Gender_info(
                        genderIcon: FontAwesomeIcons.mars,
                        genderLabel: 'MALE',
                      ),
                      myColor: selectedGender == Gender.male
                          ? inActiveColor(toCheck)
                          : activeColor(toCheck),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: BoxContainer(
                      myChild: Gender_info(
                        genderIcon: FontAwesomeIcons.venus,
                        genderLabel: 'FEMALE',
                      ),
                      myColor: selectedGender == Gender.female
                          ? inActiveColor(toCheck)
                          : activeColor(toCheck),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: KnumberStyle,
                            ),
                            Text("cm"),
                          ],
                        ),
                        Slider(
                            min: 120,
                            max: 220,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ],
                    ),
                    myColor: toCheck
                        ? activeDarkContainerColor
                        : activeLightContainerColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxContainer(
                    myColor: toCheck
                        ? activeDarkContainerColor
                        : activeLightContainerColor,
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          weight.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CirclularButton(
                              myIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CirclularButton(
                              myIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BoxContainer(
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          age.toString(),
                          style: KnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CirclularButton(
                              myIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CirclularButton(
                              myIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    myColor: toCheck
                        ? activeDarkContainerColor
                        : activeLightContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: toCheck ? Color(0xFFEB1555) : Colors.green[800],
           child: BottomButton(onPressed: (){
             Calculator calcultor = Calculator(height: height, weight: weight);
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultScreen(bmi: calcultor.findBmi(),bmiText: calcultor.findText(),bmiInterpretation: calcultor.getInterpretation(),)));
           }, btnText: "Calculate",),
          ),
        ],
      ),
    );
  }
}
