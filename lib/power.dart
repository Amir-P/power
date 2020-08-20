
import 'dart:async';

import 'package:flutter/services.dart';

class Power {
  static const MethodChannel _channel =
      const MethodChannel('power');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
