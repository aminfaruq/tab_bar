import 'package:flutter/material.dart';

import 'hal_komputer.dart' as Komputer;
import 'hal_radio.dart' as Radio;
import 'hal_headset.dart' as Headset;
import 'hal_smartphone.dart' as hp;


void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Daftar elektronik"),
        backgroundColor: Colors.blue[200],
        /*bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),),
            new Tab(icon: new Icon(Icons.headset),),
            new Tab(icon: new Icon(Icons.radio),),
            new Tab(icon: new Icon(Icons.smartphone),),
          ],
        ),*/
      ),


      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new Komputer.Komputer(),
          new Headset.Headset(),
          new Radio.Radio(),
          new hp.SmartPhone()
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.blue[200],
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),),
            new Tab(icon: new Icon(Icons.headset),),
            new Tab(icon: new Icon(Icons.radio),),
            new Tab(icon: new Icon(Icons.smartphone),),
          ],
        ),
      ),
    );
  }
}
