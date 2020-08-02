
import 'package:flutter/services.dart';

class ShowVolumeControl {
  static const MethodChannel _channel =
      const MethodChannel('show_volume_control');


  void show() async {
    await _channel.invokeMethod('show');
  }
}
