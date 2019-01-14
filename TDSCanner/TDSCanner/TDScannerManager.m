//
//  TDScannerManager.m
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TDScannerManager.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>

@implementation TDScannerManager


/** 校验是否有相机权限 */
+ (void)td_checkCameraAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted
{
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    switch (videoAuthStatus) {
            // 已授权
        case AVAuthorizationStatusAuthorized:
        {
            permissionGranted(YES);
        }
            break;
            // 未询问用户是否授权
        case AVAuthorizationStatusNotDetermined:
        {
            // 提示用户授权
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                permissionGranted(granted);
            }];
        }
            break;
            // 用户拒绝授权或权限受限
        case AVAuthorizationStatusRestricted:
        case AVAuthorizationStatusDenied:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请在”设置-隐私-相机”选项中，允许访问你的相机" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            permissionGranted(NO);
        }
            break;
        default:
            break;
    }
}

/** 校验是否有相册权限 */
+ (void)td_checkAlbumAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted {
    
    PHAuthorizationStatus photoAuthStatus = [PHPhotoLibrary authorizationStatus];
    switch (photoAuthStatus) {
            // 已授权
        case PHAuthorizationStatusAuthorized:
        {
            permissionGranted(YES);
        }
            break;
            // 未询问用户是否授权
        case PHAuthorizationStatusNotDetermined:
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                permissionGranted(status == PHAuthorizationStatusAuthorized);
            }];
        }
            break;
            // 用户拒绝授权或权限受限
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请在”设置-隐私-相片”选项中，允许访问你的相册" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            permissionGranted(NO);
        }
            break;
        default:
            break;
    }
    
}

/** 根据扫描器类型配置支持编码格式 */
+ (NSArray *)td_metadataObjectTypesWithType:(TDScannerType)scannerType {
    switch (scannerType) {
        case TDScannerTypeQRCode:
        {
            return @[AVMetadataObjectTypeQRCode];
        }
            break;
        case TDScannerTypeBarCode:
        {
            return @[AVMetadataObjectTypeEAN13Code,
                     AVMetadataObjectTypeEAN8Code,
                     AVMetadataObjectTypeUPCECode,
                     AVMetadataObjectTypeCode39Code,
                     AVMetadataObjectTypeCode39Mod43Code,
                     AVMetadataObjectTypeCode93Code,
                     AVMetadataObjectTypeCode128Code,
                     AVMetadataObjectTypePDF417Code];
        }
            break;
        case TDScannerTypeBoth:
        {
            return @[AVMetadataObjectTypeQRCode,
                     AVMetadataObjectTypeEAN13Code,
                     AVMetadataObjectTypeEAN8Code,
                     AVMetadataObjectTypeUPCECode,
                     AVMetadataObjectTypeCode39Code,
                     AVMetadataObjectTypeCode39Mod43Code,
                     AVMetadataObjectTypeCode93Code,
                     AVMetadataObjectTypeCode128Code,
                     AVMetadataObjectTypePDF417Code];
        }
            break;
        default:
            break;
    }
}

/** 根据扫描器类型配置导航栏标题 */
+ (NSString *)td_navigationItemTitleWithType:(TDScannerType)scannerType {
    switch (scannerType) {
        case TDScannerTypeQRCode:
        {
            return @"二维码";
        }
            break;
        case TDScannerTypeBarCode:
        {
            return @"条码";
        }
            break;
        case TDScannerTypeBoth:
        {
            return @"二维码/条码";
        }
            break;
        default:
            break;
    }
}

/** 手电筒开关 */
+ (void)td_FlashlightOn:(BOOL)on {
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
        [captureDevice lockForConfiguration:nil];
        if (on) {
            [captureDevice setTorchMode:AVCaptureTorchModeOn];
            [captureDevice setFlashMode:AVCaptureFlashModeOn];
        }else
        {
            [captureDevice setTorchMode:AVCaptureTorchModeOff];
            [captureDevice setFlashMode:AVCaptureFlashModeOff];
        }
        [captureDevice unlockForConfiguration];
    }
}


@end
