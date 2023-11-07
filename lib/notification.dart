import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

class Notification {
  Notification._() {
    _windowsNotification = WindowsNotification(applicationId: "appname");
    if (Platform.isLinux || Platform.isMacOS) {
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: _onDidReceiveNotification,
      );
      const LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings = InitializationSettings(macOS: initializationSettingsDarwin, linux: initializationSettingsLinux);
      _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (details) => _onDidReceiveNotification(details.id ?? 0, details.input, details.notificationResponseType.name, details.actionId));
    }
  }

  late WindowsNotification _windowsNotification;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  String? _appName;


  set appName(String value) {
    _appName = value;
    _windowsNotification = WindowsNotification(applicationId: _appName);
  }

  static final Notification instance = Notification._();

  void show({required String title, required String message, Map<String, dynamic>? payload}) async {
    if (Platform.isWindows) {
      await _windowsNotification.showNotificationPluginTemplate(
          NotificationMessage.fromPluginTemplate(PageStorageKey(DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()).value, title, message, payload: payload ?? {}));
    } else if (Platform.isMacOS || Platform.isLinux) {
      await _flutterLocalNotificationsPlugin.show(DateTime.now().millisecondsSinceEpoch, title, message, null,payload: jsonEncode(payload));
    }
  }

  void _onDidReceiveNotification(int id, String? title, String? body, String? payload) {
    if (kDebugMode) {
      print("DID_NOTIFICATION [$id] [$title] [$body] [$payload]");
    }
  }
}

final notification = Notification.instance;
