//
//  TDScannerView.h
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDScannerConfig.h"





NS_ASSUME_NONNULL_BEGIN
@interface TDScannerView : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(TDScannerConfig *)config;

/** 添加扫描线条动画 */
- (void)td_addScannerLineAnimation;

/** 暂停扫描线条动画 */
- (void)td_pauseScannerLineAnimation;

/** 添加指示器 */
- (void)td_addActivityIndicator;

/** 移除指示器 */
- (void)td_removeActivityIndicator;

- (CGFloat)scanner_x;
- (CGFloat)scanner_y;
- (CGFloat)scanner_width;

/**
 显示手电筒
 @param animated 是否附带动画
 */
- (void)td_showFlashlightWithAnimated:(BOOL)animated;

/**
 隐藏手电筒
 @param animated 是否附带动画
 */
- (void)td_hideFlashlightWithAnimated:(BOOL)animated;

/**
 设置手电筒开关
 @param on YES:开  NO:关
 */
- (void)td_setFlashlightOn:(BOOL)on;

/**
 获取手电筒当前开关状态
 @return YES:开  NO:关
 */
- (BOOL)td_flashlightOn;


@end

NS_ASSUME_NONNULL_END
