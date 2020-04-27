import 'package:flutter/material.dart';
import 'package:pph/chart.dart';

class HeadBubble extends StatelessWidget {

  bool presbutstate = false;

  double pressure=40.0;

  List<SensorValue> pressuredata = [
    SensorValue(DateTime.fromMillisecondsSinceEpoch(100),40.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(200),45.5),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(300),56.0 ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Helmet",style: TextStyle(color: Colors.white,fontSize:20)),
      ),
      body: 
      Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Colors.teal[100],
          ),
          child: Chart(pressuredata),
        ),
    );
  }
}
