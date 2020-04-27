import 'package:flutter/material.dart';
import 'package:pph/chart.dart';
import 'package:pph/temperature.dart';
import 'package:pph/head_bubble.dart';
import 'package:pph/ecg.dart';

class Temperature extends StatelessWidget {

  bool presbutstate = false;

  double pressure=39.5;
  double patient_temperature=39.5;
  bool ecg_state_good = true;


    List<SensorValue> chamber_temperature_data = [
    SensorValue(DateTime.fromMillisecondsSinceEpoch(100),24.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(200),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(300),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(400),24.2),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(500),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(600),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(700),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(800),24.2),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(900),24.1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature",style: TextStyle(color: Colors.white,fontSize:20)),
      ),
      body: 
      SafeArea(child: 

GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[

                   Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white10,

          ),

                   Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white10,

          ),


          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue[300],
          child:
           Column(children: <Widget>[
              
              //
              const Text('Last', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Temperature', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Measure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              Text("$patient_temperature", style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold)),
              const Text('Safety Values: 35.5-37.5', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
          
      
              ],
              ),
            ),
      
      

Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration( 
    borderRadius: BorderRadius.all(
      Radius.circular(18),
  ),
  color: Colors.black,
  ),
child: Chart(chamber_temperature_data),
),

         Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white10,

          ),

                   Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white10,

          ),

                   Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white10,

          ),


Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue[200],
          child:
           Column(children: <Widget>[
              
              //
              const Text('More', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('About', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Temperature', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Measure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('+', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
      
              ],
              ),
            ),


          ],
        ),


        
      ),

    );
  }    
}