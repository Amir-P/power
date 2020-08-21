import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:power/power.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lowPowerMode = false;

  @override
  void initState() {
    super.initState();
    initPowerState();
  }

  Future<void> initPowerState() async {
    bool lowPowerMode;

    try {
      lowPowerMode = await Power.isLowPowerMode;
    } on PlatformException {
      lowPowerMode = false;
    }

    if (!mounted) return;

    setState(() {
      _lowPowerMode = lowPowerMode;
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
          child: Text('Low power mode is ${_lowPowerMode ? 'on' : 'off'}'),
        ),
      ),
    );
  }
}
