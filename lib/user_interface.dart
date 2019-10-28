import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

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
  String _ipAddress = '192.168.1.145';
  int _port = 37110;
  _UserInterfaceState(this._mainAxisAlignment, this._crossAxisAlignment,
      this._instruction, this._icon); // Constructor

// Method to loop while the button is pressed and change the state
  void _controlVehicle(instruction) async {
    // async to have code work asynchronously
    // Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed, user: boformer
    if (_loopActive) return;
    _loopActive = true;
    while (_buttonPressed) {
      // loops while controls are being pressed.
      setState(() {
        _moveCar(instruction); // Moves the car for the button that is pressed
      });
      await Future.delayed(
          Duration(microseconds: 1)); // If no delay, this will endlessly loop
    }
    if (_instruction == 'forward' || _instruction == 'backward') {
      // Stops car motors
      _moveCar('stop forward/backward');
    } else {
      _moveCar('stop turn');
    }
    _loopActive = false;
  }

  // Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed, user: boformer
  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Wrap fixed infinite pixel error
      children: <Widget>[
        Listener(
          // Listener to listen for button interaction
          onPointerDown: (details) {
            _buttonPressed = true;
            _controlVehicle(
                _instruction); // Changes the state when button is pressed
          },
          onPointerUp: (details) {
            _buttonPressed = false;
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
              size: 80.0,
            ),
          ),
        )
      ],
    );
  }

  void _moveCar(instruction) {
    // Send instruction to raspberry pi
    // Source for sending data packets with datagrams over dart: http://www.jamesslocum.com/post/77759061182
    RawDatagramSocket.bind(InternetAddress.anyIPv4,
            _port) // Binds the pi address and port for communication
        .then((RawDatagramSocket socket) {
      socket.send(instruction.codeUnits, new InternetAddress(_ipAddress),
          _port); // Send the instruction to the pi
    });
  }
}
