import 'package:first_test/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user_interface.dart';
import 'bluetooth_interface.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EGEN 310',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'EGEN 310'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    BluetoothInterface _bluetoothDevice = new BluetoothInterface();
    _bluetoothDevice.connect();

    //sourced from https://proandroiddev.com/flutter-creating-multi-page-application-with-navigation-ef9f4a72d181
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
        
      ),
      // Following code help with source : https://www.youtube.com/watch?v=pTJJsmejUOQ
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new CameraApp()),
          );
        },
        child: Icon(Icons.camera_alt),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserInterface(
              MainAxisAlignment.center, // Create the left button
              CrossAxisAlignment.end,
              "left",
              Icons.keyboard_arrow_left,
              _bluetoothDevice),
          Text('Turn'),
          UserInterface(
              MainAxisAlignment.center, // Create the turn right button
              CrossAxisAlignment.end,
              "right",
              Icons.keyboard_arrow_right,
              _bluetoothDevice),

          Column(
            // Column for forward / Backward movement
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                UserInterface(
                  // Create the forward button
                    MainAxisAlignment.center,
                    CrossAxisAlignment.end,
                    "forward",
                    Icons.keyboard_arrow_up,
                    _bluetoothDevice),
                Text('Forw / Back'),
                UserInterface(
                  // Create the turn backward button

                    MainAxisAlignment.center,
                    CrossAxisAlignment.end,
                    "backward",
                    Icons.keyboard_arrow_down,
                    _bluetoothDevice),
              ]),
          // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),

    );
  }
}