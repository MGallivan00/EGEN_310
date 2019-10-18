import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Following code help with source: https://www.youtube.com/watch?v=pTJJsmejUOQ
class UserInterface extends StatelessWidget {
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  String _buttonName;

  String _instruction;

  UserInterface(this._mainAxisAlignment, this._crossAxisAlignment, this._buttonName, this._instruction); // Constructor
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: _mainAxisAlignment,
          crossAxisAlignment: _crossAxisAlignment,
          children: <Widget>[
            // Help creating button from source: https://api.flutter.dev/flutter/material/RaisedButton-class.html
            RaisedButton(
          onPressed: () {print(_instruction);},
              child: Text(_buttonName),
            )

          ],
    );
  }
}
