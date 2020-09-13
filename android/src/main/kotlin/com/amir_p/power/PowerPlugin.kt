package com.amir_p.power

import android.content.Context
import android.os.BatteryManager
import android.os.PowerManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** PowerPlugin */
public class PowerPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var applicationContext: Context

    constructor()

    constructor(context: Context) {
        applicationContext = context
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "com.amir_p/power")
        channel.setMethodCallHandler(this);
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "com.amir_p/power")
            channel.setMethodCallHandler(PowerPlugin(registrar.context()))
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPowerMode") {
            val powerManager: PowerManager = applicationContext.getSystemService(Context.POWER_SERVICE) as PowerManager
            val powerSaveMode: Boolean = powerManager.isPowerSaveMode
            result.success(powerSaveMode)
        } else if (call.method == "getBatteryLevel") {
            val batteryManager: BatteryManager = applicationContext.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            val batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            result.success(batteryLevel)
        } else if(call.method == "getChargingStatus"){
            val batteryManager: BatteryManager = applicationContext.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            result.success(batteryManager.isCharging)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
