//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <notification/notification_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) notification_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NotificationPlugin");
  notification_plugin_register_with_registrar(notification_registrar);
}
