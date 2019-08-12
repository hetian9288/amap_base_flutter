package me.yohom.amapbase

import me.yohom.amapbase.location.Init
import me.yohom.amapbase.location.StartLocate
import me.yohom.amapbase.location.StopLocate
import me.yohom.amapbase.search.*

/**
 * 搜索功能集合
 */
val SEARCH_METHOD_HANDLER: Map<String, SearchMethodHandler> = mapOf(
        "search#calculateDriveRoute" to CalculateDriveRoute,
        "search#searchPoi" to SearchPoiKeyword,
        "search#searchPoiBound" to SearchPoiBound,
        "search#searchPoiPolygon" to SearchPoiPolygon,
        "search#searchPoiId" to SearchPoiId,
        "search#searchRoutePoiLine" to SearchRoutePoiLine,
        "search#searchRoutePoiPolygon" to SearchRoutePoiPolygon,
        "search#searchGeocode" to SearchGeocode,
        "search#searchReGeocode" to SearchReGeocode,
        "search#searchBusStation" to SearchBusStation,
        "tool#distanceSearch" to DistanceSearchHandler
)

/**
 * 定位功能集合
 */
val LOCATION_METHOD_HANDLER: Map<String, LocationMethodHandler> = mapOf(
        "location#init" to Init,
        "location#startLocate" to StartLocate,
        "location#stopLocate" to StopLocate
)
