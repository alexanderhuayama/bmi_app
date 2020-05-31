import 'dart:math';

class CalculadoraBMI {
  final int altura;
  final int peso;
  double _bmi;

  CalculadoraBMI({this.altura, this.peso});

  String calcularBMI() {
    _bmi = peso / pow(altura / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultado() {
    if (_bmi >= 25) {
      return 'Sobre Peso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Bajo de Peso';
    }
  }

  String getInterpretacion() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to excercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weiht. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
