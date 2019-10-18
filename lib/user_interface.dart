import 'package:flutter/material.dart';
// Following code help with source: https://www.youtube.com/watch?v=pTJJsmejUOQ
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

