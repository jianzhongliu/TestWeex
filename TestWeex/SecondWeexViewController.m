//
//  SecondWeexViewController.m
//  TestWeex
//
//  Created by liujianzhong on 16/9/6.
//  Copyright © 2016年 liujianzhong. All rights reserved.
//

#import "SecondWeexViewController.h"

@interface SecondWeexViewController ()

@end

@implementation SecondWeexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        NSLog(@"%@",view);
        //        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:view];
    };
    
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:error delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
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
