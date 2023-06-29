#import "WindowsAdapterPlugin.h"
#if __has_include(<windows_adapter/windows_adapter-Swift.h>)
#import <windows_adapter/windows_adapter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "windows_adapter-Swift.h"
#endif

@implementation WindowsAdapterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWindowsAdapterPlugin registerWithRegistrar:registrar];
}
@end
