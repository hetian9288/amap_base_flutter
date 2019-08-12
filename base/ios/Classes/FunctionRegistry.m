//
// Created by Yohom Bao on 2018-12-12.
//

#import "FunctionRegistry.h"
#import "IMethodHandler.h"
#import "LocationHandlers.h"
#import "SearchHandlers.h"


static NSDictionary<NSString *, NSObject <SearchMethodHandler> *> *_searchDictionary;

@implementation SearchFunctionRegistry {

}
+ (NSDictionary<NSString *, NSObject <SearchMethodHandler> *> *)searchMethodHandler {
    if (!_searchDictionary) {
        _searchDictionary = @{
                @"search#calculateDriveRoute": [CalculateDriveRoute alloc],
                @"search#searchPoi": [SearchPoiKeyword alloc],
                @"search#searchPoiBound": [SearchPoiBound alloc],
                @"search#searchPoiPolygon": [SearchPoiPolygon alloc],
                @"search#searchPoiId": [SearchPoiId alloc],
                @"search#searchRoutePoiLine": [SearchRoutePoiLine alloc],
                @"search#searchRoutePoiPolygon": [SearchRoutePoiPolygon alloc],
                @"search#searchGeocode": [SearchGeocode alloc],
                @"search#searchReGeocode": [SearchReGeocode alloc],
                @"tool#distanceSearch":[DistanceSearch alloc],
                @"search#searchBusStation":[SearchBusStation alloc],
        };
    }
    return _searchDictionary;
}

@end


static NSDictionary<NSString *, NSObject <LocationMethodHandler> *> *_locationDictionary;

@implementation LocationFunctionRegistry {

}
+ (NSDictionary<NSString *, NSObject <LocationMethodHandler> *> *)locationMethodHandler {
    if (!_locationDictionary) {
        _locationDictionary = @{
                @"location#init": [Init alloc],
                @"location#startLocate": [StartLocate alloc],
                @"location#stopLocate": [StopLocate alloc],
        };
    }
    return _locationDictionary;
}

@end
