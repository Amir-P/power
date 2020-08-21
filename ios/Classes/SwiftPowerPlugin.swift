import Flutter
import UIKit

public class SwiftPowerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.amir_p/power", binaryMessenger: registrar.messenger())
    let instance = SwiftPowerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(ProcessInfo.processInfo.isLowPowerModeEnabled)
  }
}
