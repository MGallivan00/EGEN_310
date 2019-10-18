import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Following code help with source: https://www.youtube.com/watch?v=pTJJsmejUOQ
class UserInterface extends StatefulWidget {
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  IconData _button;
  String _instruction;

  UserInterface(this._mainAxisAlignment, this._crossAxisAlignment, this._button,
      this._instruction);

  @override
  _UserInterfaceState createState() => _UserInterfaceState(
      this._mainAxisAlignment,
      this._crossAxisAlignment,
      this._button,
      this._instruction);
}

// Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed
class _UserInterfaceState extends State<UserInterface> {
  bool _buttonPressed = false;
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  IconData _button;
  String _instruction;
    bool _loopActive = false;

  _UserInterfaceState(
      this._mainAxisAlignment,
      this._crossAxisAlignment,
      this._button,
      this._instruction);

// async to have code work asynchronously
  void _controlVehicle() async{
    if(_loopActive) return;
    _loopActive = true;
    while (_buttonPressed) {
      setState(() {
        _changeMotorValue();
      });
            await Future.delayed(Duration(milliseconds: 1));

    }
  _loopActive = false;
  }

// Following code sourced from : https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed
  @override
  Widget build(BuildContext context) {
    return Wrap(

      children: <Widget>[
        Listener(
          onPointerDown: (details) {
            _buttonPressed = true;
            _controlVehicle();
            },
          onPointerUp: (details) {
            _buttonPressed = false;
            stop();
          },

          child: Container(
            decoration: BoxDecoration(color: Colors.deepPurple, border: Border.all()),
            padding: EdgeInsets.all(16.0),
            child: Text(_instruction)),

        )
      ],
    );
  }

  void _changeMotorValue() {
    print(_instruction);
  }
    void stop() {
    print("stop " );
  }
}
