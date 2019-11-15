import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';

// Following code help with source: https://www.youtube.com/watch?v=tPcuBo5QAW4

class CameraApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera App',
    );
  }
}

class MyCameraPage extends StatefulWidget{
  MyCameraPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCameraPageState createState() => _MyCameraPageState();
}

class _MyCameraPageState extends State<MyCameraPage> {
  String _streamUrl;
  VlcPlayerController _vlcViewController;

  void initState() {
    super.initState();
    _vlcViewController = new VlcPlayerController();
  }

  void _beginStream(){
    setState(() {
      _streamUrl = ''; //raspberry pi stream url
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new VlcPlayer(
                  defaultHeight: 480,
                  defaultWidth: 640,
                  url: _streamUrl,
                  controller: _vlcViewController,
                  placeholder: Container(),
                )
              ])
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _beginStream();
          },
          child: Icon(Icons.camera_alt),
      backgroundColor: Colors.amber,
    ));
  }
}