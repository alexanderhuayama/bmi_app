import 'package:bmiapp/screens/constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget content;

  MyCard({this.color, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kActiveCardColour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: content,
    );
  }
}
