import 'package:bmiapp/components/mi_boton.dart';
import 'package:bmiapp/components/my_button.dart';
import 'package:bmiapp/components/my_card.dart';
import 'package:bmiapp/models/calculadora_bmi.dart';
import 'package:bmiapp/screens/constants.dart';
import 'package:bmiapp/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Sexo { Mujer, Hombre }

class _InputPageState extends State<InputPage> {
  int altura = 173;
  int peso = 94;
  int edad = 22;
  Sexo sexo = Sexo.Mujer;

  void cambiarAltura(double newValue) {
    setState(() {
      altura = newValue.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    onTap: () {
                      setState(() {
                        sexo = Sexo.Hombre;
                      });
                    },
                    color: sexo == Sexo.Hombre
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onTap: () {
                      setState(() {
                        sexo = Sexo.Mujer;
                      });
                    },
                    color: sexo == Sexo.Mujer
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              color: kActiveCardColour,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '$altura cm',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Flexible(
                    child: Slider(
                      value: altura.toDouble(),
                      activeColor: kBottomContainerColour,
                      min: 120,
                      max: 220,
                      onChanged: cambiarAltura,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    color: kActiveCardColour,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$peso',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(
                              iconData: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  --peso;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyButton(
                              iconData: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  ++peso;
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
                  child: MyCard(
                    color: kActiveCardColour,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$edad',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(
                              iconData: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  --edad;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyButton(
                              iconData: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  ++edad;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MiBoton(
            nombreBoton: 'CALCULATE',
            onTap: () {
              var calculadoraBMI = CalculadoraBMI(
                altura: altura,
                peso: peso,
              );
              var bmi = calculadoraBMI.calcularBMI();
              var resultado = calculadoraBMI.getResultado();
              var interpretacion = calculadoraBMI.getInterpretacion();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: bmi,
                    resultado: resultado,
                    interpretacion: interpretacion,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
