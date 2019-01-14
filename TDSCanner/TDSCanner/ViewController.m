//
//  ViewController.m
//  TDSCanner
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TDQRCodeViewController.h"
#import "TDScannerConfig.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnclick{
    TDScannerConfig *config = [[TDScannerConfig alloc] init];
    config.scannerType = TDScannerTypeBoth;
    TDQRCodeViewController *vc = [TDQRCodeViewController new];
    vc.config = config;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
