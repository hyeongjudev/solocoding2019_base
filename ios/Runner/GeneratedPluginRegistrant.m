//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <device_calendar/DeviceCalendarPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <scheduled_notifications/ScheduledNotificationsPlugin.h>
#import <share/SharePlugin.h>
#import <sqflite/SqflitePlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DeviceCalendarPlugin registerWithRegistrar:[registry registrarForPlugin:@"DeviceCalendarPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [ScheduledNotificationsPlugin registerWithRegistrar:[registry registrarForPlugin:@"ScheduledNotificationsPlugin"]];
  [FLTSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
}

@end
