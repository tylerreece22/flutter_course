import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCenter }

class _MyAppState extends State<MyApp> {
  String _dropdownString;
  String _textFieldString;
  bool _checkboxValue;
  int _radioGroup;
  WhyFarther _farther;
  bool _switchValue;
  double _sliderValue;

  @override
  void initState() {
    super.initState();
    _dropdownString = _dropdownString ?? "Batman Begins";
    _textFieldString = '';
    _checkboxValue = true;
    _radioGroup = 1;
    _farther = WhyFarther.harder;
    _switchValue = true;
    _sliderValue = 0.33;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Course -- Buttons"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Note that the DropdownButton does not hot reload very well
          DropdownButton<String>(
            value: _dropdownString,
            onChanged: (String newValue) {
              setState(() {
                _dropdownString = newValue;
              });
            },
            items: <String>[
              'Batman Begins',
              'The Dark Knight',
              'The Dark Knight Rises'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextField(
            onChanged: (String value) {
              setState(() {
                _textFieldString = value;
              });
            },
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: _checkboxValue,
                onChanged: (bool value) {
                  setState(() {
                    print(value);
                    _checkboxValue = value;
                  });
                },
                checkColor: Colors.red,
                activeColor: Colors.amberAccent,
              ),
              Text("Notifications"),
              Radio(
                value: 1,
                groupValue: _radioGroup,
                onChanged: (T) {
                  setState(() {
                    _radioGroup = T;
                  });
                },
              ),
              Radio(
                value: 2,
                groupValue: _radioGroup,
                onChanged: (T) {
                  setState(() {
                    _radioGroup = T;
                  });
                },
              ),
              Radio(
                value: 3,
                groupValue: _radioGroup,
                onChanged: (T) {
                  setState(() {
                    _radioGroup = T;
                  });
                },
              ),
              PopupMenuButton<WhyFarther>(
                onSelected: (WhyFarther result) {
                  print(result);
                  setState(() {
                    _farther = result;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem(
                          value: WhyFarther.harder,
                          child: Text("Working a lot harder")),
                      const PopupMenuItem(
                          value: WhyFarther.selfStarter,
                          child: Text("Being a lot smarter")),
                      const PopupMenuItem(
                          value: WhyFarther.smarter,
                          child: Text("Being a self starter")),
                      const PopupMenuItem(
                          value: WhyFarther.tradingCenter,
                          child:
                              Text("Placed in charge of the trader charter")),
                    ],
              ),
              IconButton(
                icon: Icon(Icons.map),
                tooltip: "Open the map",
                onPressed: () {
                  setState(() {
                    print("Opening the map");
                  });
                },
              )
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  print("Flat button pressed");
                },
                child: Text("Flat Button"),
                color: Colors.red,
                textColor: Colors.white,
                highlightColor: Colors.grey,
              ),
              RaisedButton(
                child: Text("Raised Button"),
                onPressed: () {
                  print("Raised button pressed");
                },
                color: Colors.red,
                textColor: Colors.white,
                highlightColor: Colors.grey,
                highlightElevation: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  print("Floating button pressed");
                },
                child: Icon(Icons.add),
              )
            ],
          ),
          Switch(
            value: _switchValue,
            onChanged: (bool state) {
              setState(() {
                _switchValue = state;
              });
            },
          ),
          Slider(
            value: _sliderValue,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
            activeColor: Colors.red,
          ),
        ],
      )),
    ));
  }
}
