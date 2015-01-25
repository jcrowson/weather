//
//  WAForecastCell.h
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAWeather.h"

@interface WAForecastCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

- (void)setupCellWithForecast:(WAWeather *)weatherFromForecast;

@end
