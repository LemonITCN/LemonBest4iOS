//
//  ViewController.m
//  LemonBestSamples
//
//  Created by Lemonsoft on 2017/3/12.
//  Copyright © 2017年 Lemonsoft. All rights reserved.
//

#import "ViewController.h"
#import "LemonBestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LemonBestView *as = [LemonBestView defaultView];
        [as clear];
        as.headViewHeight = 44;
        as.title = @"这是一个普通的LemonBestView";
        LemonBestItem *cancel = [[LemonBestItem alloc] initWithTitle: @"取消" onTouchBlock:^(LemonBestView *bestView, LemonBestItem *item) {
            [as hide];
        }];
        ((UILabel *)cancel.contentView).textColor = [UIColor redColor];
        [as addAction: cancel groupIndex: 0];
        [as addActionGroup];
        as.backViewControllerScale = 1;// 设置1 就没有后边viewController的缩放效果了
        [as addAction: [[LemonBestItem alloc] initWithTitle:@"第一项" onTouchBlock:^(LemonBestView *bestView, LemonBestItem *item) {
            self.valueLabel.text = @"value 1";
        }] groupIndex: 1];
        [as addAction: [[LemonBestItem alloc] initWithTitle:@"第二项" onTouchBlock:^(LemonBestView *bestView, LemonBestItem *item) {
            self.valueLabel.text = @"value 2";
        }] groupIndex: 1];
        [as show];

    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
