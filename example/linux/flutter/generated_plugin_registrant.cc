//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <windows_adapter/windows_adapter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) windows_adapter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowsAdapterPlugin");
  windows_adapter_plugin_register_with_registrar(windows_adapter_registrar);
}
