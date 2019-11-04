import 'dart:convert';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothInterface {
  BluetoothInterface();
  Future<BluetoothConnection> _device;

  void connect() {
    print('In widget');
// Listen to scan results
    // do something with scan result
    _device = BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');
  }

  void writeOut(message) {
    _device.then((connection) {
      Utf8Encoder encoder = Utf8Encoder();
      message = encoder.convert(message);
      connection.output.add(message);
    });
  }
}
