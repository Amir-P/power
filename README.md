# Power

A Flutter plugin to access device power related information.

![pub package](https://img.shields.io/pub/v/power.svg)

## Usage

To use this plugin, add power as a dependency in your pubspec.yaml file.

``` yaml
  dependencies:
    flutter:
      sdk: flutter
    power: ^0.2.0
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
```

## Features

- [x] Get low power mode
- [x] Get battery level
- [ ] Get charging status
- [ ] Build widgets in response to power changes
- [ ] Disable animations in low power mode
