//
//  SecondWeexViewController.h
//  TestWeex
//
//  Created by liujianzhong on 16/9/6.
//  Copyright © 2016年 liujianzhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeexSDK/WeexSDK.h>

@interface SecondWeexViewController : UIViewController

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) NSString *url;

@end
