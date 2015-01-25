//
//  WAWeatherCell.m
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "WAWeatherCell.h"

@implementation WAWeatherCell

- (void)setupCellWithWeather:(WAWeather *)weather {
    
    self.temperatureLabel.text = [NSString stringWithFormat:@"%i%@", (int)weather.temperature,  @"\u00B0"];
    self.cityLabel.text = weather.city;
}

@end
