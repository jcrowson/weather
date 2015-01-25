//
//  WALocationManager.m
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "WALocationManager.h"
#import "CLLocationManager+blocks.h"

@implementation WALocationManager {
    CLLocationManager *locationManager;
}

- (void)locateUserWithCompletion:(WALocationManagerCompletionHandler)completion {
    
    locationManager = [CLLocationManager updateManagerWithAccuracy:50.0 locationAge:15.0 authorizationDesciption:CLLocationUpdateAuthorizationDescriptionAlways];
    [locationManager startUpdatingLocationWithUpdateBlock:^(CLLocationManager *manager, CLLocation *location, NSError *error, BOOL *stopUpdating) {
        completion(location, nil);
        *stopUpdating = YES;
    }];
}

@end
