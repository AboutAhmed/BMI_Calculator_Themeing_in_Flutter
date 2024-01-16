import 'dart:math';

class Calculator{

  Calculator({this.height, this.weight});
  int? height;
  int? weight;

  double? bmi;

  double findBmi(){
    bmi = weight! / pow(height!/100,2);
    return bmi!;
  }
  String findText(){
    if(bmi! >=25){
      return 'OverWeight';
    }else if(bmi! > 18){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }
  String getInterpretation(){
    if(bmi! >=25){
      return 'Your weight is too high, try to do some exercise';
    }else if(bmi! > 18){
      return 'Your Weight is Normal, its good';
    }else{
      return 'you\'re UnderWeight, plz take some calories extra';
    }
  }

}