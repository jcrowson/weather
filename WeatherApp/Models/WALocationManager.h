//
//  WALocationManager.h
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface WALocationManager : NSObject <CLLocationManagerDelegate>

typedef void (^WALocationManagerCompletionHandler)(CLLocation *location, NSError *error);

- (void)locateUserWithCompletion:(WALocationManagerCompletionHandler)completion;


@end
