#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
  FlutterMethodChannel * channel = [FlutterMethodChannel methodChannelWithName:@"getFlavorConfiguration"
                                                               binaryMessenger:controller];
  [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
    NSString *flavorConfig = (NSString *) [[NSBundle mainBundle] objectForInfoDictionaryKey:@"FlavorConfiguration"];
    result(flavorConfig);
  }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
