//
//  WAWeather.h
//  WeatherApp
//
//  Created by James Crowson on 1/23/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface WAWeather : NSObject

typedef void (^WAWeatherResponseCompletionHandler)(WAWeather *weather, NSError *error);
typedef void (^WAFiveDayForecastResponseCompletionHandler)(NSArray *forecast, NSError *error);


@property (strong, nonatomic) NSString *city;
@property double temperature;
@property double forecastTemperature;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *day;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (void)getWeatherWithLocation:(CLLocation *)location andCompletion:(WAWeatherResponseCompletionHandler)completion;

+ (void)getFiveDayForecastWithLocation:(CLLocation *)location :(WAFiveDayForecastResponseCompletionHandler)completion;

- (double)convertTemperatureToFarenheitWithKelvin:(double)kelvin;


@end
