#include "include/windows_adapter/windows_adapter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "windows_adapter_plugin.h"

void WindowsAdapterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  windows_adapter::WindowsAdapterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
