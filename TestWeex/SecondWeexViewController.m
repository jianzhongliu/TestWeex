//
//  SecondWeexViewController.m
//  TestWeex
//
//  Created by liujianzhong on 16/9/6.
//  Copyright © 2016年 liujianzhong. All rights reserved.
//

#import "SecondWeexViewController.h"

@interface SecondWeexViewController ()
@property (nonatomic, strong) UIView *weexView;
@end

@implementation SecondWeexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat width = self.view.frame.size.width;
    CGFloat weexHeight = self.view.frame.size.height - 64;

    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 0, width, weexHeight);
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        NSLog(@"%@",view);
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"%@",error);
        if ([[error domain] isEqualToString:@"1"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableString *errMsg=[NSMutableString new];
                [errMsg appendFormat:@"ErrorType:%@\n",[error domain]];
                [errMsg appendFormat:@"ErrorCode:%ld\n",(long)[error code]];
                [errMsg appendFormat:@"ErrorInfo:%@\n", [error userInfo]];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errMsg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            });
        };
        //process failure
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        NSLog(@"%@",view);
        //process renderFinish
    };
    NSURL *url = [NSURL URLWithString:self.url];
    [_instance renderWithURL:url options:@{@"bundleUrl":[url absoluteString]} data:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
