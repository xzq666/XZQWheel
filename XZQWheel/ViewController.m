//
//  ViewController.m
//  MyWeel
//
//  Created by 许卓权 on 2017/10/19.
//  Copyright © 2017年 许卓权. All rights reserved.
//

#import "ViewController.h"
#import "XZQCountButton.h"

@interface ViewController ()

@property(nonatomic,strong) XZQCountButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[XZQCountButton alloc] initWithDuration:60 buttonClicked:^{
        //如果有网络请求处理可写在此处
        [self.btn startCount];
    } counStart:^{
        [self.btn setTitle:@"60秒" forState:UIControlStateNormal];
    } countRun:^(NSInteger restCount) {
        [self.btn setTitle:[NSString stringWithFormat:@"%ld秒", restCount] forState:UIControlStateNormal];
    } countComlete:^{
        [self.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }];
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, 90, 200, 30);
    [self.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
