//
//  TopToolView.m
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/7.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import "TopToolView.h"
#import "Useful_Define.h"
#import "Masonry.h"

@interface TopToolView()

// 左边按钮
@property(nonatomic, strong) UIButton *leftItemButton;
// 右边第一个按钮
@property(nonatomic, strong) UIButton *rightItemFirstButton;
// 右边第二个按钮
@property(nonatomic, strong) UIButton *rightItemSecondButton;
// 搜索框
@property(nonatomic, strong) UIView *searchView;
// 搜索按钮
@property(nonatomic, strong) UIButton *searchButton;
// 语音按钮
@property(nonatomic, strong) UIButton *voiceButton;

@end

@implementation TopToolView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

// UI
- (void)setUpUI {
    self.backgroundColor = [UIColor clearColor];
    // 添加梯度图层
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = self.bounds;
    layer.colors = @[(id)[UIColor colorWithWhite:0 alpha:0.2].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.15].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.1].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.05].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.03].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.01].CGColor,
                     (id)[UIColor colorWithWhite:0 alpha:0.0].CGColor];
    [self.layer addSublayer:layer];
    // 添加控件
    _leftItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftItemButton setImage:[UIImage imageNamed:@"shouye_icon_scan_white"] forState:UIControlStateNormal];
    [_leftItemButton addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_leftItemButton];
    
    _rightItemFirstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightItemFirstButton setImage:[UIImage imageNamed:@"shouye_icon_sort_white"] forState:UIControlStateNormal];
    [_rightItemFirstButton addTarget:self action:@selector(rightFirstItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightItemFirstButton];
    
    _rightItemSecondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightItemSecondButton setImage:[UIImage imageNamed:@"icon_gouwuche_title_white"] forState:UIControlStateNormal];
    [_rightItemSecondButton addTarget:self action:@selector(rightSecondItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightItemSecondButton];
    
    _searchView = [[UIView alloc] init];
    _searchView.backgroundColor = [UIColor whiteColor];
    _searchView.layer.cornerRadius = 16.0;
    [_searchView.layer masksToBounds];
    [self addSubview:_searchView];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton setTitle:@"彩电年终内购会" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _searchButton.titleLabel.font = [UIFont fontWithName:PFR size:13.0];
    [_searchButton setImage:[UIImage imageNamed:@"group_home_search_gray"] forState:0];
    [_searchButton adjustsImageWhenHighlighted];
    _searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 2 * 10, 0, 0);
    _searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_searchButton];
    
    _voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _voiceButton.adjustsImageWhenHighlighted = NO;
    [_voiceButton setImage:[UIImage imageNamed:@"icon_voice_search"] forState:UIControlStateNormal];
    [_voiceButton addTarget:self action:@selector(voiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_voiceButton];
}

// 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_leftItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20+SafeArea_Height);
        make.left.equalTo(self.mas_left).offset(0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_rightItemFirstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_leftItemButton.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_rightItemSecondButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_leftItemButton.mas_centerY);
        make.right.equalTo(_rightItemFirstButton.mas_left).offset(5);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftItemButton.mas_right).offset(5);
        make.right.equalTo(_rightItemSecondButton.mas_left).offset(5);
        make.height.equalTo(@32);
        make.centerY.equalTo(_rightItemSecondButton);
    }];
    
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchView);
        make.top.equalTo(_searchView);
        make.height.mas_equalTo(_searchView);
        make.right.equalTo(_searchView).offset(-10);
    }];
    
    [_voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_searchView);
        make.centerY.equalTo(_searchView);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
}

// 左边按钮点击
- (void)leftItemClick {
    !_leftItemClickBlock ? : _leftItemClickBlock();
}

// 右边第一个按钮点击
- (void)rightFirstItemClick {
    !_rightItemFirstClickBlock ? : _rightItemFirstClickBlock();
}

// 右边第二个按钮点击
- (void)rightSecondItemClick {
    !_rightItemSecondClickBlock ? : _rightItemSecondClickBlock();
}

// 搜索按钮点击
- (void)searchButtonClick {
    !_searchButtonClickBlock ? : _searchButtonClickBlock();
}

// 语音按钮点击
- (void)voiceButtonClick {
    !_voiceButtonClickBlock ? :_voiceButtonClickBlock();
}

@end
