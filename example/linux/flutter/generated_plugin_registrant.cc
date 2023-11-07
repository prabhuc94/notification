//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desk_notify/notification_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) desk_notify_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NotificationPlugin");
  notification_plugin_register_with_registrar(desk_notify_registrar);
}
