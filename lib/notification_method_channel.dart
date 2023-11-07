import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'notification_platform_interface.dart';

/// An implementation of [NotificationPlatform] that uses method channels.
class MethodChannelNotification extends NotificationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('notification');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
