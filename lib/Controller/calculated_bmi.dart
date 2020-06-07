import 'dart:math';

class CalculatorBMI {
  final int height;
  final int weight;
  double _bmiResult;

  CalculatorBMI({this.height, this.weight});

  String calculateBMI() {
    _bmiResult = weight / pow(height / 100, 2);
    return _bmiResult.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiResult >= 25) {
      return "Overweight ";
    } else if (_bmiResult > 18.5) {
      return "Normal ";
    } else {
      return "Underweight ";
    }
  }

  String getResultInterpretation() {
    if (_bmiResult >= 25) {
      return "You have higher than normal body weight. Try to excersise more.";
    } else if (_bmiResult >= 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }
}
