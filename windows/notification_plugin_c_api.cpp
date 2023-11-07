#include "include/notification/notification_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "notification_plugin.h"

void NotificationPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  notification::NotificationPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
