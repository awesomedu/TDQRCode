//
//  TDScannerConfig.m
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TDScannerConfig.h"

@implementation TDScannerConfig

- (instancetype)init{
    if (self = [super init]) {
        self.scannerCornerColor = [UIColor colorWithRed:63/255.0 green:187/255.0 blue:54/255.0 alpha:1.0];
        self.scannerBorderColor = [UIColor whiteColor];
        self.indicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    }
    return self;
}

@end
