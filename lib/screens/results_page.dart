import 'package:bmiapp/components/mi_boton.dart';
import 'package:bmiapp/components/my_card.dart';
import 'package:bmiapp/screens/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String resultado;
  final String interpretacion;

  ResultsPage({this.bmi, this.resultado, this.interpretacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 48,
              ),
            ),
          ),
          Expanded(
            child: MyCard(
              color: kActiveCardColour,
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultado.toUpperCase(),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 84,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      interpretacion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MiBoton(
            nombreBoton: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
