//
//  TDQRCodeViewController.h
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDScannerConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface TDQRCodeViewController : UIViewController
@property (nonatomic, strong) TDScannerConfig *config;

@end

NS_ASSUME_NONNULL_END
