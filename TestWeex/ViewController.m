//
//  ViewController.m
//  TestWeex
//
//  Created by liujianzhong on 16/9/6.
//  Copyright © 2016年 liujianzhong. All rights reserved.
//

#import "ViewController.h"
#import "SecondWeexViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITextView *textInput;
@property (nonatomic, strong) UIButton *buttonConfirm;
@end

@implementation ViewController
- (UITextView *)textInput {
    if (_textInput == nil) {
        _textInput = [[UITextView alloc] init];
        _textInput.font = [UIFont systemFontOfSize:13];
        _textInput.textColor = [UIColor redColor];
        _textInput.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textInput.layer.borderWidth = 1;
        _textInput.text = @"http://";
    }
    return _textInput;
}
- (UIButton *)buttonConfirm {
    if (_buttonConfirm == nil) {
        _buttonConfirm = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonConfirm addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonConfirm.selected = NO;
        [_buttonConfirm setTitle:@"下一步" forState:UIControlStateNormal];
        [_buttonConfirm setBackgroundColor:[UIColor purpleColor]];
        [_buttonConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonConfirm.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonConfirm.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _buttonConfirm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textInput.frame = CGRectMake(10, 20, ScreenWidth - 20, 100);
    self.buttonConfirm.frame = CGRectMake(10, 140, ScreenWidth - 20, 44);
    
    [self.view addSubview:self.textInput];
    [self.view addSubview:self.buttonConfirm];
    

}

- (void)onClickButtonAction:(UIButton *) button {
    SecondWeexViewController *controller = [[SecondWeexViewController alloc] init];
    controller.url = self.textInput.text;
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
