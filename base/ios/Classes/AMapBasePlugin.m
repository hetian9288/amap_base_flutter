#import "AMapServices.h"
#import "AMapBasePlugin.h"
#import "IMethodHandler.h"
#import "FunctionRegistry.h"

static NSObject <FlutterPluginRegistrar> *_registrar;

@implementation AMapBasePlugin

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    [AMapServices sharedServices].enableHTTPS = YES;
    _registrar = registrar;

    // 设置权限 channel
    FlutterMethodChannel *permissionChannel = [FlutterMethodChannel
            methodChannelWithName:@"me.yohom/permission"
                  binaryMessenger:[registrar messenger]];
    [permissionChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        result(@YES);
    }];

    // 设置key channel
    FlutterMethodChannel *setKeyChannel = [FlutterMethodChannel
            methodChannelWithName:@"me.yohom/amap_base"
                  binaryMessenger:[registrar messenger]];
    [setKeyChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        if ([@"setKey" isEqualToString:call.method]) {
            NSString *key = call.arguments[@"key"];
            [AMapServices sharedServices].apiKey = key;
            result(@"key设置成功");
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

    

    // 搜索channel
    FlutterMethodChannel *searchChannel = [FlutterMethodChannel
            methodChannelWithName:@"me.yohom/search"
                  binaryMessenger:[registrar messenger]];
    [searchChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSObject <SearchMethodHandler> *handler = [SearchFunctionRegistry searchMethodHandler][call.method];
        if (handler) {
            [[handler init] onMethodCall:call :result];
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

    

    // 定位 channel
    FlutterMethodChannel *locationChannel = [FlutterMethodChannel
            methodChannelWithName:@"me.yohom/location"
                  binaryMessenger:[registrar messenger]];
    [locationChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSObject <LocationMethodHandler> *handler = [LocationFunctionRegistry locationMethodHandler][call.method];
        if (handler) {
            [[handler init] onMethodCall:call :result];
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

   
}

+ (NSObject <FlutterPluginRegistrar> *)registrar {
    return _registrar;
}

@end
