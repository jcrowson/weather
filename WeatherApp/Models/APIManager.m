//
//  APIManager.m
//  WeatherApp
//
//  Created by James Crowson on 1/23/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>
#import "WAWeather.h"


#define kWeatherAPIEndPoint @"http://api.openweathermap.org/data/2.5/"

@implementation APIManager

+ (void)getWeatherWithLocation:(CLLocation *)location andCompletion:(WAAPIResponseCompletionHandler)completion {
    
    NSString *coords = [NSString stringWithFormat:@"lat=%f&lon=%f", location.coordinate.latitude, location.coordinate.longitude];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@weather?%@", kWeatherAPIEndPoint, coords]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
            completion(responseObject, nil);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

+ (void)getFiveDayForecastWithLocation:(CLLocation *)location andCompletion:(WAAPIResponseCompletionHandler)completion {
    
    NSString *coords = [NSString stringWithFormat:@"lat=%f&lon=%f", location.coordinate.latitude, location.coordinate.longitude];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@forecast/daily?%@&cnt=5&mode=json", kWeatherAPIEndPoint, coords]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             completion(responseObject, nil);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}


+ (void)getFiveDayForecast {
    
}



@end
