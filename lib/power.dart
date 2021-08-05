import 'dart:async';
import 'package:flutter/services.dart';

class Power {
  /// Method channel for interacting with native platform.
  static const MethodChannel _methodChannel =
      const MethodChannel('com.amir_p/power');

  /// Uses method channel for getting low power mode.
  static Future<bool> get isLowPowerMode async {
    return await _methodChannel.invokeMethod('getPowerMode');
  }

  /// Uses method channel for getting battery level.
  ///
  /// Returns -1 if batteryState is unknown in iOS
  static Future<num> get batteryLevel async {
    return await _methodChannel.invokeMethod('getBatteryLevel');
  }

  /// Uses method channel for getting charging status.
  static Future<bool> get isCharging async {
    return await _methodChannel.invokeMethod('getChargingStatus');
  }
}
