//
//  XZQCountButtonViewController.m
//  XZQWheel
//
//  Created by 许卓权 on 2018/2/12.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import "XZQCountButtonViewController.h"
#import "XZQCountButton.h"
#import "Useful_Define.h"

@interface XZQCountButtonViewController ()

@property(nonatomic,strong) XZQCountButton *btn;

@end

@interface XZQCountButtonViewController ()

@end

@implementation XZQCountButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"倒计时按钮";
    
    self.btn = [[XZQCountButton alloc] initWithDuration:60 buttonClicked:^{
        //如果有网络请求处理可写在此处
        [self.btn startCount];
    } counStart:^{
        [self.btn setTitle:@"60秒" forState:UIControlStateNormal];
        [self.btn.layer setBorderColor:[UIColor grayColor].CGColor];
    } countRun:^(NSInteger restCount) {
        [self.btn setTitle:[NSString stringWithFormat:@"%ld秒", restCount] forState:UIControlStateNormal];
    } countComlete:^{
        [self.btn.layer setBorderColor:[UIColor blueColor].CGColor];
        [self.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }];
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, 100, 200, 30);
    [self.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    ViewBorderRadius(self.btn, 3.0, 1.0, [UIColor blueColor]);
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
