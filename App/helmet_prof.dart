import 'package:flutter/material.dart';
import 'package:pph/chart.dart';
import 'package:pph/temperature.dart';
import 'package:pph/head_bubble.dart';
import 'package:pph/ecg.dart';

class HelmetProfessional extends StatelessWidget {

  bool presbutstate = false;

  double pressure=39.5;
  double temperature=26.7;
  bool ecg_state_good = true;

  List<SensorValue> chamber_pressure_data = [
    SensorValue(DateTime.fromMillisecondsSinceEpoch(100),45.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(200),45.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(300),45.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(400),45.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(500),45.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(600),45.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(700),45.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(800),45.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(900),45.0),
  ];

    List<SensorValue> chamber_temperature_data = [
    SensorValue(DateTime.fromMillisecondsSinceEpoch(100),24.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(200),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(300),24.1),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(400),24.2),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(500),24.2),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(600),24.2),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(700),24.3),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(800),24.3),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(900),24.3),
  ];

      List<SensorValue> chamber_co2_data = [
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
          color: Colors.lightGreen,
          child:
           Column(children: <Widget>[
              
              //
              const Text('Last', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Pressure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Measure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              Text("$pressure", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              const Text('Safety Values: 10-50', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
          
      
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
child: Chart(chamber_pressure_data),
),


           // Container(
          //padding: const EdgeInsets.all(8),
          //color: Colors.lightGreen,
          //child:
            //  Column(children: <Widget>[
              
              //
             // const Text('Safety', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
             // const Text('Values', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
             // const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              //const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
             // const Text('30.00-50.00', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
             // ],
             // ),
           // ),

            

          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightGreen[300],
          child:
           Column(children: <Widget>[
              
              //
              const Text('Last', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Temperature', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Measure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              Text("$temperature", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              const Text('Safety Values: 24-29', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
      
              ],
              ),
            ),

          // Container(
          //padding: const EdgeInsets.all(8),
          //color: Colors.lightGreen[300],
         // child:
           //   Column(children: <Widget>[
              
              //
             // const Text('Safety', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              //const Text('Values', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
            //  const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              //const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              //const Text('24.00-30.00', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //],
              //),
            //),
         


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
          color: Colors.lightGreen[200],
          child:
           Column(children: <Widget>[
              
              //
              const Text('CO2', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Retainment', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Measure', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              Text("Under control", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              const Text('', style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
      
              ],
              ),
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
          color: Colors.lightGreen[100],
          child:
           Column(children: <Widget>[
              
              //
              const Text('More', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('About', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('Helmet', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              //const Text('Requirements', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              const Text('+', style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
      
              ],
              ),
            ),


          ],
        ),


        
      ),

    );
  }    
}