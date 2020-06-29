import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int weight;
  final int height;
  double _bmi;
  String CalculateBMI() {
    _bmi= weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getResult() {
    if (_bmi>=25)
      {
   return 'overweight';

      }
    else if(_bmi>18.5)
      {
        return 'Normal';
      }
    else
      {
        return 'Underweight';
      }
  }
  String getIntrpretation()
  {
    if (_bmi>=25)
    {
      return ' You have a higher than normal body weight so exercise on daily basis';

    }
    else if(_bmi>18.5)
    {
      return ' You have a normal body weight , GOOD JOB';
    }
    else
    {
      return ' You have a lower than normal body weight , eat more';
    }
  }
}