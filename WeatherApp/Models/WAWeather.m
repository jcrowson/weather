//
//  WAWeather.m
//  WeatherApp
//
//  Created by James Crowson on 1/23/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "WAWeather.h"
#import "APIManager.h"

@implementation WAWeather

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }

    // The single weather attributes
    
    self.city = [attributes valueForKey:@"name"];
    self.temperature = [self convertTemperatureToFarenheitWithKelvin:[[attributes valueForKeyPath:@"main.temp"] doubleValue]];
    
    // The forecast weather attributes
    
    self.forecastTemperature = [self convertTemperatureToFarenheitWithKelvin:[[attributes valueForKeyPath:@"temp.day"] doubleValue]];
    self.date = [attributes valueForKey:@"dt"];
    
    NSTimeInterval dt = [[attributes valueForKey:@"dt"] doubleValue];
    NSDate *weatherDateInForecast = [NSDate dateWithTimeIntervalSince1970:dt];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    self.day = [dateFormatter stringFromDate:weatherDateInForecast];
    
    return self;
}

# pragma mark - Weather Methods
+ (void)getWeatherWithLocation:(CLLocation *)location andCompletion:(WAWeatherResponseCompletionHandler)completion {
    
    [APIManager getWeatherWithLocation:location
                         andCompletion:^(id response, NSError *error) {
        if (!error) {
            WAWeather *weather = [[WAWeather alloc] initWithAttributes:response];
            completion(weather, nil);
        }
    }];
}

+ (void)getFiveDayForecastWithLocation:(CLLocation *)location :(WAFiveDayForecastResponseCompletionHandler)completion {
    
    [APIManager getFiveDayForecastWithLocation:location
                                 andCompletion:^(id response, NSError *error) {
        if (!error) {
            
            NSArray *listOfWeatherFromJSON = [response valueForKey:@"list"];
            NSMutableArray *forecast = [[NSMutableArray alloc]init];
            
            for (NSDictionary *weatherItem in listOfWeatherFromJSON) {
                WAWeather *weather = [[WAWeather alloc]initWithAttributes:weatherItem];
                [forecast addObject:weather];
            }
            
            completion(forecast, nil);
        }
    }];
    
}
#pragma mark - Helper Methods
- (double)convertTemperatureToFarenheitWithKelvin:(double)kelvin {
    double fahrenheit;
    return fahrenheit = (kelvin - 273.15)*1.8000 + 32;
}

@end
