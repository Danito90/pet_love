import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 130.0,
        animation: true,
        /*  animationDuration: 1, */
        lineWidth: 15.0,
        percent: 1,
        center: new Text(
          "Cargando",
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.yellow,
        progressColor: Colors.red,
      ), /* LinearPercentIndicator(
        width: 170.0,
        animation: true,
        animationDuration: 1000,
        lineHeight: 16.0,
        leading: Container(width: 60, child: Text("Java")),
        percent: 0.75,
        linearStrokeCap: LinearStrokeCap.butt,
        progressColor: Colors.green,
      ), */
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
