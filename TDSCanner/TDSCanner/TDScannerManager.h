//
//  TDScannerManager.h
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDScanner.h"

NS_ASSUME_NONNULL_BEGIN

@interface TDScannerManager : NSObject

/**
 校验是否有相机权限
 
 @param permissionGranted 获取相机权限回调
 */
+ (void)td_checkCameraAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted;

/**
 校验是否有相册权限
 
 @param permissionGranted 获取相机权限回调
 */
+ (void)td_checkAlbumAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted;

/**
 根据扫描器类型配置支持编码格式
 
 @param scannerType 扫描器类型
 @return 编码格式组成的数组
 */
+ (NSArray *)td_metadataObjectTypesWithType:(TDScannerType)scannerType;

/** 根据扫描器类型配置导航栏标题 */
+ (NSString *)td_navigationItemTitleWithType:(TDScannerType)scannerType;

/**
 手电筒开关
 @param on YES:打开 NO:关闭
 */
+ (void)td_FlashlightOn:(BOOL)on;

@end

NS_ASSUME_NONNULL_END
