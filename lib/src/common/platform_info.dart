// import 'dart:io';
// import 'devic';
import 'package:device_info/device_info.dart';

import 'package:platform_info/platform_info.dart';

import 'package:package_info_plus/package_info_plus.dart';
// import 'package:flutter/services.dart';

// /// Holds data that's different on Android and iOS
class PlatformInfo {
  // ignore: unused_field
  final String userAgent;
  // ignore: unused_field
  final String paystackBuild;
  // ignore: unused_field
  final String deviceId;

  static Future<PlatformInfo?> getinfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final platform = Platform.instance.operatingSystem;
    var deviceInfo = await DeviceInfoPlugin().androidInfo;
    String pluginVersion = packageInfo.version;
    // : Platform.instance.isIOS
    //     ? DeviceInfoPlugin().iosInfo
    //     : "NOT MOBILE";
    String deviceId = deviceInfo.id;
    String userAgent = "${platform}_Paystack_$pluginVersion";
    return PlatformInfo._(
      userAgent: userAgent,
      paystackBuild: pluginVersion,
      deviceId: deviceId,
    );
  }

  PlatformInfo._({
    required String userAgent,
    required String paystackBuild,
    required String deviceId,
  })  : userAgent = userAgent,
        paystackBuild = paystackBuild,
        deviceId = deviceId;

  @override
  String toString() {
    return '[userAgent = $userAgent, paystackBuild = $paystackBuild, deviceId = $deviceId]';
  }
}
