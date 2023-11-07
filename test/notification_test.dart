import 'package:flutter_test/flutter_test.dart';
import 'package:desk_notify/notification_platform_interface.dart';
import 'package:desk_notify/notification_method_channel.dart';
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
