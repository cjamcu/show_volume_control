import 'package:flutter/material.dart';
import 'package:show_volume_control/show_volume_control.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ShowVolumeControl _showVolumeControl = ShowVolumeControl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Show Volume Control Example'),
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                _showVolumeControl.show();
              },
              child: Text("Show")),
        ),
      ),
    );
  }
}
