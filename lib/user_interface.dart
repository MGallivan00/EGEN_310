import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Following code help with source: https://www.youtube.com/watch?v=pTJJsmejUOQ
class UserInterface extends StatelessWidget {
  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  IconData _button;
  String _instruction;
  bool _buttonPressed = false;

  UserInterface(this._mainAxisAlignment, this._crossAxisAlignment, this._button,
      this._instruction); // Constructor
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      children: <Widget>[
        // Help creating button from source: https://api.flutter.dev/flutter/material/RaisedButton-class.html
//        IconButton(
//          icon: Icon(_button),
//          iconSize: 150.0,
//          splashColor: Colors.deepPurple,
//          tooltip: 'Controls the vehicle',
//          onPressed: () {
//            _buttonPressed = true;
//            while(_buttonPressed) {
//              buttonAction();
//            }
//            }


//          child: Text(_buttonName),
//        ),
      FloatingActionButton(
        onPressed: buttonAction,
        splashColor: Colors.amber,
        child:
          Icon(_button)

      )

      ],
    );
  }

  void buttonAction() {
    print(_instruction);
    print("-----------");
    _buttonPressed = false;
  }
}
