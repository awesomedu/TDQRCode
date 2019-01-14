//
//  TDScannerConfig.h
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TDScannerType) {
    TDScannerTypeQRCode, //二维码
    TDScannerTypeBarCode, //条码
    TDScannerTypeBoth, //支持二维码以及条码
};

typedef NS_ENUM(NSInteger, TDScannerArea) {
    TDScannerAreaDefault,
    TDScannerAreaFullScreen,
};

NS_ASSUME_NONNULL_BEGIN

@interface TDScannerConfig : NSObject
/** 类型 */
@property (nonatomic, assign) TDScannerType scannerType;
/** 扫描区域 */
@property (nonatomic, assign) TDScannerArea scannerArea;
/** 棱角颜色 */
@property (nonatomic, strong) UIColor *scannerCornerColor;
/** 边框颜色 */
@property (nonatomic, strong) UIColor *scannerBorderColor;
/** 指示器风格 */
@property (nonatomic, assign) UIActivityIndicatorViewStyle indicatorViewStyle;

@end

NS_ASSUME_NONNULL_END
