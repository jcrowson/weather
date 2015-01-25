//
//  WAWeatherTableViewController.m
//  WeatherApp
//
//  Created by James Crowson on 1/23/15.
//  Copyright (c) 2015 James Crowson. All rights reserved.
//

#import "WAWeatherTableViewController.h"
#import "WAWeather.h"
#import "WAWeatherCell.h"
#import "WAForecastCell.h"
#import "SVProgressHUD.h"
#import "WALocationManager.h"
#import "Constants.h"

@interface WAWeatherTableViewController ()

@end

@implementation WAWeatherTableViewController {
    NSArray *weatherForecast;
    WAWeather *weatherItem;
    WALocationManager *locationManager;
    CLLocation *currentLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - View methods
- (void)viewWillAppear:(BOOL)animated {
    
    [SVProgressHUD show];
    [self locateUser];
}


#pragma mark - Location and Weather Methods
- (void)locateUser {
    locationManager = [[WALocationManager alloc]init];
    [locationManager locateUserWithCompletion:^(CLLocation *location, NSError *error) {
        if (!error) {
            currentLocation = location;
            [self getWeatherData];
        }
    }];
}

- (void)getWeatherData {
    [WAWeather getWeatherWithLocation:currentLocation andCompletion:^(WAWeather *weather, NSError *error) {
        if (!error) {
            weatherItem = weather;
            [self getForecast];
        }
    }];
}

- (void)getForecast {
    [WAWeather getFiveDayForecastWithLocation:currentLocation :^(NSArray *forecast, NSError *error) {
        if (!error) {
            weatherForecast = forecast;
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        WAWeatherCell *cell = (WAWeatherCell *)[tableView dequeueReusableCellWithIdentifier:@"weatherCell"];
        if (weatherItem) {
            [cell setupCellWithWeather:weatherItem];
        }
        return cell;
    }
    else {
        WAForecastCell *cell = (WAForecastCell *)[tableView dequeueReusableCellWithIdentifier:@"forecastCell"];
        if (weatherForecast.count != 0) {
            [cell setupCellWithForecast:[weatherForecast objectAtIndex:indexPath.row]];
        }
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 250;
    }
    else {
        return 85;
    }
    return 0;
}


@end
