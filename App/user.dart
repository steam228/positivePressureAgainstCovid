import 'package:flutter/material.dart';
import 'package:pph/chart.dart';
import 'package:pph/temperature.dart';
import 'package:pph/head_bubble.dart';
import 'package:pph/ecg.dart';

class UserView extends StatelessWidget {

  double pressure=30.0;
  double temperature = 39.00;
  bool ecg_state_good = true;
  bool presbutstate = false;
  bool tempbutstate = false;
  bool ecgbutstate = false;

  List<SensorValue> pressuredata = [
    SensorValue(DateTime.fromMillisecondsSinceEpoch(100),40.0),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(200),45.5),
    SensorValue(DateTime.fromMillisecondsSinceEpoch(300),56.0 ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("User",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold)),
      ),
      body: 
      SafeArea(child: 

CustomScrollView(
    
    primary: false,
    slivers: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.deepOrange,
          child:
           Column(children: <Widget>[
              
              //
              const Text('Informations', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //
               IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HeadBubble()),
  );
          },
          icon: Icon( Icons.info),
          color: Colors.white,
          iconSize: 100,
      ),
              ],
              ),
            ),
       


            Container(
          padding: const EdgeInsets.all(8),
          color: Colors.green,
          child:
              Column(children: <Widget>[
              
              //
              const Text('Helmet', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //
              IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HeadBubble()),
  );
          },
          icon: Icon( pressure > 30.0 ? Icons.sentiment_dissatisfied  : Icons.sentiment_very_satisfied),
          color: (pressure > 30.0 ? Colors.redAccent : Colors.white),
          iconSize: 100,
      ),
              ],
              ),
            ),


            Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue,
          child:
              Column(children: <Widget>[
              
              //
              const Text('Temperature', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //
              IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Temperature()),
  );
          },
          icon: Icon( temperature > 38.0 ? Icons.sentiment_dissatisfied  : Icons.sentiment_very_satisfied),
          color: (temperature > 38.0 ? Colors.redAccent : Colors.white),
          iconSize: 100,
      ),
              ],
              ),
            ),




            Container(
          padding: const EdgeInsets.all(8),
          color: Colors.pink,
          child:
              Column(children: <Widget>[
              
              //
              const Text('ECG', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //
              IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Ecg()),
  );
          },
          icon: Icon( ecg_state_good ? Icons.sentiment_very_satisfied  : Icons.sentiment_dissatisfied),
          color: (ecg_state_good ? Colors.white : Colors.redAccent),
          iconSize: 100,
      ),
              ],
              ),
            ),

            Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,

          ),

          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,

          ),

          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,

          ),



          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey,
          child:
           Column(children: <Widget>[
              
              //
              const Text('Settings', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              //
              IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HeadBubble()),
  );
          },
          icon: Icon( Icons.settings),
          color: Colors.white,
          iconSize: 100,
      ),
              ],
              ),
            ),


          ],
        ),
      ),
    ],
  ),
      ),
    );
  }    
}