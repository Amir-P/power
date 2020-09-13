import Flutter
import UIKit

public class SwiftPowerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.amir_p/power", binaryMessenger: registrar.messenger())
        let instance = SwiftPowerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPowerMode" {
            result(ProcessInfo.processInfo.isLowPowerModeEnabled)
        } else if call.method == "getBatteryLevel" {
            var device = UIDevice.current
            device.isBatteryMonitoringEnabled = true
            if device.batteryState == .unknown {
                result(-1)
            } else {
                result(Int(device.batteryLevel * 100))
            }
        } else if call.method == "getChargingStatus" {
            var device = UIDevice.current
            device.isBatteryMonitoringEnabled = true
            result(device.batteryState == .charging || device.batteryState == .full)
        }
    }
}
