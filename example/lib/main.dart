import 'package:flutter/material.dart';
import 'dart:async';
import 'package:power/power.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lowPowerMode = false, _isCharging = false;
  num _batteryLevel = -1;

  @override
  void initState() {
    super.initState();
    initPowerState();
  }

  Future<void> initPowerState() async {
    final lowPowerMode = await Power.isLowPowerMode;
    final isCharging = await Power.isCharging;
    final batteryLevel = await Power.batteryLevel;

    if (!mounted) return;

    setState(() {
      _lowPowerMode = lowPowerMode;
      _isCharging = isCharging;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Power example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Low power mode is ${_lowPowerMode ? 'on' : 'off'}'),
              Text(
                  'Battery level is ${_batteryLevel == -1 ? 'Unavailable' : _batteryLevel} and is ${_isCharging ? 'Charging' : 'Discharging'}'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
