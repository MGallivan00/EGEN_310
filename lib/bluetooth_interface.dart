import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
class BluetoothInterface {
  BluetoothInterface();
  BluetoothConnection _device;

  Future connect() async {
    // _device = BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');
    try{
  _device = await BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');

    }
    catch(e){
      print('Cant connect to bluetooth');
    }
  }

  Future writeOut(message)  async {
    // Write out to the raspberry pi
    // _device.then((connection) {
    //   if (connection.isConnected) {
    //     // Checks if the device is connected
    //     Utf8Encoder encoder = Utf8Encoder();
    //     message = encoder
    //         .convert(message); // Encode the instruction message to UTF8 list
    //     connection.output.add(message); // Send the message
    //   } else {
    //     _device = BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');
    //   }
    // });
        try{
        Utf8Encoder encoder = Utf8Encoder();
        message = encoder.convert(message); // Encode the instruction message to UTF8 list
        print(message);
        // _device.input.listen((encode){
          _device.output.add(message);
          await _device.output.allSent;
        // });
        }
        catch (e)
      { _device.close();        
        connect();
        sleep(Duration(seconds: 1));
        }
      // try{
      // if (!_device.isConnected){
      //   // _device.finish();
      //   connect();
      //   sleep(Duration(milliseconds: 50));
      // }}
      // catch(e){}

  }
}
