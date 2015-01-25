//
//  WAWeatherCell.h
//  WeatherApp
//
//  Created by James Crowson on 1/24/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAWeather.h"

@interface WAWeatherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

- (void)setupCellWithWeather:(WAWeather *)weather;

@end
