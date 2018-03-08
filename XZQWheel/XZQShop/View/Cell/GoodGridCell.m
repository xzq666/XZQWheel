//
//  GoodGridCell.m
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/8.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import "GoodGridCell.h"
#import "Useful_Define.h"
#import "Masonry.h"
#import "GoodGridItem.h"
#import <UIImageView+WebCache.h>

@interface GoodGridCell ()

// 图片
@property(nonatomic, strong) UIImageView *gridImage;
// 文字
@property(nonatomic, strong) UILabel *gridTitle;
// 标签
@property(nonatomic, strong) UILabel *gridTag;

@end

@implementation GoodGridCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

// UI
- (void)setUI {
    _gridImage = [[UIImageView alloc] init];
    _gridImage.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_gridImage];
    
    _gridTitle = [[UILabel alloc] init];
    _gridTitle.font = [UIFont fontWithName:PFR size:13.0];
    _gridTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_gridTitle];
    
    _gridTag = [[UILabel alloc] init];
    _gridTag.font = [UIFont fontWithName:PFR size:8.0];
    _gridTag.backgroundColor = [UIColor whiteColor];
    _gridTag.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_gridTag];
}

// 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_gridImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        if (SCREEN_HEIGHT == 568) { //iphone5
            make.size.mas_equalTo(CGSizeMake(38, 38));
        } else {
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }
        make.centerX.equalTo(self);
    }];
    
    [_gridTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_gridImage.mas_bottom).offset(5);
    }];
    
    [_gridTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_gridImage.mas_centerX);
        make.top.equalTo(_gridImage);
        make.size.mas_equalTo(CGSizeMake(35, 15));
    }];
}

- (void)setGridItem:(GoodGridItem *)gridItem {
    _gridItem = gridItem;
    
    _gridTitle.text = gridItem.gridTitle;
    
    _gridTag.text = gridItem.gridTag;
    _gridTag.textColor = hexStringToColor(gridItem.gridColor);
    _gridTag.hidden = (gridItem.gridTag.length == 0) ? YES : NO;
    ViewBorderRadius(_gridTag, 5, 1, _gridTag.textColor);
    
    if (_gridItem.iconImage.length == 0) {
        return;
    }
    if ([[_gridItem.iconImage substringToIndex:4] isEqualToString:@"http"]) {
        [_gridImage sd_setImageWithURL:[NSURL URLWithString:_gridItem.iconImage] placeholderImage:[UIImage imageNamed:@"default_49_11"]];
    } else {
        _gridImage.image = [UIImage imageNamed:_gridItem.iconImage];
    }
}

@end
