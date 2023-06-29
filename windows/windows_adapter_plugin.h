#ifndef FLUTTER_PLUGIN_WINDOWS_ADAPTER_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOWS_ADAPTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace windows_adapter {

class WindowsAdapterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WindowsAdapterPlugin();

  virtual ~WindowsAdapterPlugin();

  // Disallow copy and assign.
  WindowsAdapterPlugin(const WindowsAdapterPlugin&) = delete;
  WindowsAdapterPlugin& operator=(const WindowsAdapterPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace windows_adapter

#endif  // FLUTTER_PLUGIN_WINDOWS_ADAPTER_PLUGIN_H_
