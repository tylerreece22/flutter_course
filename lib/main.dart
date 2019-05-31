import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home), text: "Home",),
            Tab(icon: Icon(Icons.map), text: "Map",),
            Tab(icon: Icon(Icons.shopping_basket), text: "Merch",),
          ]),
          title: Text("Flutter course"),
        ),
        body: TabBarView(children: [
          Text("Welcome home"),
          Text("Where are you? I dont know...."),
          Text("I like that shirt too"),
        ]),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.alarm),
                title: Text("Alarm"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}