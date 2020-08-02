import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_volume_control/show_volume_control.dart';

void main() {
  const MethodChannel channel = MethodChannel('show_volume_control');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ShowVolumeControl.platformVersion, '42');
  });
}
