//
//  WAForecastCell.m
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "WAForecastCell.h"
#import "WAWeather.h"

@implementation WAForecastCell

- (void)setupCellWithForecast:(WAWeather *)weatherFromForecast {
    
    self.dayLabel.text = weatherFromForecast.day;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%i%@", (int)weatherFromForecast.temperature,  @"\u00B0"];
}

@end
