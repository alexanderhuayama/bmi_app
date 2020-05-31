import 'package:bmiapp/screens/constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget content;
  final Function onTap;

  MyCard({
    this.color,
    this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: content,
      ),
    );
  }
}
