//
//  ViewController.m
//  MyWeel
//
//  Created by 许卓权 on 2017/10/19.
//  Copyright © 2017年 许卓权. All rights reserved.
//  效果展示主控制器

#import "ViewController.h"
#import "Masonry.h"
#import "Useful_Define.h"
#import "XZQCountButtonViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *dataArr; // 列表文字数组
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"效果展示";
    
    dataArr = @[@"倒计时按钮"];
    
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(NavBar_Height);
        make.left.right.bottom.mas_offset(0);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row < dataArr.count) {
        cell.textLabel.text = dataArr[indexPath.row];
    } else {
        cell.textLabel.text = @"待更新";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            XZQCountButtonViewController *countButtonVC = [[XZQCountButtonViewController alloc] init];
            countButtonVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:countButtonVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
