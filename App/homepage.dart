import 'package:flutter/material.dart';
//import 'package:pphgo/chart.dart';
import 'package:pph/user.dart';
import 'package:pph/professional.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ToGo Helmet",style: TextStyle(color: Colors.white,fontSize:20)),
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
          color: Colors.white,

          ),


          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,

          ),

          Container(
          padding: const EdgeInsets.all(8),
          color: Colors.indigoAccent,
          child:
           Column(children: <Widget>[
              
              
              const Text("Health Professional",style: TextStyle(color: Colors.white,fontSize:28.7, fontWeight: FontWeight.bold)),
              
          IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfessionalView()),
  );
          },
          icon: Icon( Icons.arrow_forward_ios),
          color: Colors.white,
          iconSize: 30,
      ),
              ],
              ),
           ),
          
       

            Container(
          padding: const EdgeInsets.all(8),
          color: Colors.pinkAccent,
          child:
           Column(children: <Widget>[
              
              //
              const Text("Device     User",style: TextStyle(color: Colors.white,fontSize:28.7, fontWeight: FontWeight.bold)),
              //
              IconButton(
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UserView()),
  );
          },
          icon: Icon( Icons.arrow_forward_ios),
          color: Colors.white,
          iconSize: 30,
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