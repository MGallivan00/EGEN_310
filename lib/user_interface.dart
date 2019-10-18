import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Following code help with source: https://www.youtube.com/watch?v=pTJJsmejUOQ
class UserInterface extends StatefulWidget {
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  String _instruction;
  IconData _icon;

  UserInterface(this._mainAxisAlignment, this._crossAxisAlignment,
      this._instruction, this._icon); // Constructor for UserInterface

  @override
  _UserInterfaceState createState() => _UserInterfaceState(
      this._mainAxisAlignment,
      this._crossAxisAlignment,
      this._instruction,
      this._icon); // Create instance of _UserInterfaceState
}

// Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed
class _UserInterfaceState extends State<UserInterface> {
  bool _buttonPressed = false; // Boolean if the button is pressed
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  String _instruction;
  bool _loopActive = false;
  IconData _icon;

  _UserInterfaceState(this._mainAxisAlignment, this._crossAxisAlignment,
      this._instruction, this._icon); // Constructor

// Method to loop while the button is pressed and change the state
  void _controlVehicle() async {
    // async to have code work asynchronously
    if (_loopActive) return;
    _loopActive = true;
    while (_buttonPressed) {
      setState(() {
        _changeMotorValue(); // Change the motor value while the button is pressed
      });
      await Future.delayed(
          Duration(milliseconds: 1)); // If no delay, this will endlessly loop
    }
    _loopActive = false;
  }

// Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed
  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Wrap fixed infinite pixel error
      children: <Widget>[
        Listener(
          // Listener to listen for button interaction
          onPointerDown: (details) {
            _buttonPressed = true;
            _controlVehicle(); // Changes the state when button is pressed
          },
          onPointerUp: (details) {
            _buttonPressed = false;
            stop(); // Will stop motor value change
          },
          child: Container(
            // Creates the buttons
            decoration: BoxDecoration(color: Colors.deepPurple),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(10.0),

            child: Icon(
              // Adds Arrow Icon to button
              _icon,
              color: Colors.black87,
              size: 90.0,
            ),
          ),
        )
      ],
    );
  }

  void _changeMotorValue() {
    // Method to change the motor value
    print(_instruction);
  }

  void stop() {
    // Method to stop motor values.
    print("stop ");
  }
}
