//
//  ViewController.m
//  Line-Calculator
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"
#import "LineCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //2+2*2 = 6
    LineCalculator *calc1 = [LineCalculator defaultValue:2];
    [[calc1 add:2] multiply:2];
    NSLog(@"2+2*2 = %@", calc1);

    //10+83 = 93
    LineCalculator *calc2 = [LineCalculator defaultValue:10];
    [calc2 add:83];
    NSLog(@"10+83 = %@", calc2);

    //4^1^1^1*2+80-11*1-41-65 = -29
    LineCalculator *calc3 = [LineCalculator defaultValue:4];
    [[[[[[[[[calc3 pow:1] pow:1] pow:1] multiply:2] add:80] subtract:11] multiply:1] subtract:41] subtract:65];
    NSLog(@"4^1^1^1*2+80-11*1-41-65 = %@", calc3);

    //6+14-16+36*1-46+57*1 = 51
    LineCalculator *calc4 = [LineCalculator defaultValue:6];
    [[[[[[[calc4 add:14] subtract:16] add:36] multiply:1] subtract:46] add:57] multiply:1];
    NSLog(@"6+14-16+36*1-46+57*1 = %@", calc4);

    //10^1^1 = 10
    LineCalculator *calc5 = [LineCalculator defaultValue:10];
    [[calc5 pow:1] pow:1];
    NSLog(@"10^1^1 = %@", calc5);

    //7-94-97*1^1*1^1-65^1 = -249
    LineCalculator *calc6 = [LineCalculator defaultValue:7];
    [[[[[[[[calc6 subtract:94] subtract:97] multiply:1] pow:1] multiply:1] pow:1] subtract:65] pow:1];
    //[[calc6 subtract:94] subtract:97];
    NSLog(@"7-94-97*1^1*1^1-65^1 = %@", calc6);

    //7-43-43*1-60+8-28 = -159
    LineCalculator *calc7 = [LineCalculator defaultValue:7];
    [[[[[[calc7 subtract:43] subtract:43] multiply:1] subtract:60] add:8] subtract:28];
    NSLog(@"7-43-43*1-60+8-28 = %@", calc7);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
