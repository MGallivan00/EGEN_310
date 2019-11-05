import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothInterface {
  BluetoothInterface();
  Future<BluetoothConnection> _device;

  void connect() {
    _device = BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');
  }

  Future<void> writeOut(message) async {
    // Write out to the raspberry pi
    _device.then((connection) {
      if (connection.isConnected) {
        // Checks if the device is connected
        Utf8Encoder encoder = Utf8Encoder();
        message = encoder
            .convert(message); // Encode the instruction message to UTF8 list
        connection.output.add(message); // Send the message
      } else {
        _device = BluetoothConnection.toAddress('B8:27:EB:9B:0D:DF');
      }
    });
  }
}
