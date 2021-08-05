# Power

A Flutter plugin to access device power related information.

![pub package](https://img.shields.io/pub/v/power.svg)

## Usage

To use this plugin, add power as a dependency in your pubspec.yaml file.

``` yaml
dependencies:
  flutter:
    sdk: flutter
  power: ^0.5.0
```

## Example

``` dart
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
```

## Features

- [x] Get low power mode
- [x] Get battery level
- [x] Get charging status
- [ ] Build widgets in response to power changes
- [ ] Disable animations in low power mode
