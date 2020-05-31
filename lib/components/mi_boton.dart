import 'package:bmiapp/screens/constants.dart';
import 'package:flutter/material.dart';

class MiBoton extends StatelessWidget {
  final String nombreBoton;
  final Function onTap;

  MiBoton({this.nombreBoton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            nombreBoton,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(
          top: 10,
        ),
        height: 50,
      ),
    );
  }
}
