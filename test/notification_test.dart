import 'package:flutter_test/flutter_test.dart';
import 'package:notification/notification.dart';
import 'package:notification/notification_platform_interface.dart';
import 'package:notification/notification_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNotificationPlatform
    with MockPlatformInterfaceMixin
    implements NotificationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NotificationPlatform initialPlatform = NotificationPlatform.instance;

  test('$MethodChannelNotification is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNotification>());
  });

  test('getPlatformVersion', () async {
  });
}
