#import "ShowVolumeControlPlugin.h"
#if __has_include(<show_volume_control/show_volume_control-Swift.h>)
#import <show_volume_control/show_volume_control-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "show_volume_control-Swift.h"
#endif

@implementation ShowVolumeControlPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShowVolumeControlPlugin registerWithRegistrar:registrar];
}
@end
