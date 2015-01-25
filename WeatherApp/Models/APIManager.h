//
//  APIManager.h
//  WeatherApp
//
//  Created by James Crowson on 1/23/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface APIManager : NSObject

typedef void (^WAAPIResponseCompletionHandler)(id response, NSError *error);

+ (void)getWeatherWithLocation:(CLLocation *)location
                andCompletion:(WAAPIResponseCompletionHandler)completion;

+ (void)getFiveDayForecastWithLocation:(CLLocation *)location andCompletion:(WAAPIResponseCompletionHandler)completion;

@end
