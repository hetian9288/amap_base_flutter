//
// Created by Yohom Bao on 2018-12-12.
//

#import <Foundation/Foundation.h>

@protocol SearchMethodHandler;
@interface SearchFunctionRegistry : NSObject
+ (NSDictionary<NSString *, NSObject <SearchMethodHandler> *> *)searchMethodHandler;
@end


@protocol LocationMethodHandler;
@interface LocationFunctionRegistry : NSObject
+ (NSDictionary<NSString *, NSObject <LocationMethodHandler> *> *)locationMethodHandler;
@end
