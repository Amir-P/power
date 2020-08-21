import 'dart:async';
import 'package:flutter/services.dart';

class Power {
  static const MethodChannel _methodChannel =
      const MethodChannel('com.amir_p/power');

  static Future<bool> get isLowPowerMode async {
    return await _methodChannel.invokeMethod('getPowerMode');
  }
}
