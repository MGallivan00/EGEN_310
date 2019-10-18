import 'package:flutter/material.dart';

class UserInterface extends StatelessWidget{
  String _text;

  UserInterface(this._text);
  @override
  Widget build(BuildContext context){
    return Container(
    child: Text(_text),
    );

  }
}

