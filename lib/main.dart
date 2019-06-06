import 'package:flutter/material.dart';
import 'UserMap.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() => runApp(CoffeeApp());

class CoffeeApp extends StatefulWidget {
  @override
  _CoffeeAppState createState() => new _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {

  static GoogleMapController mapController;

  static final LatLng _center = const LatLng(45.521563, -122.677433);

  static void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    ),
    Text(
      'My Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.amberAccent
      ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Coffee App'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text('Map'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Account'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
