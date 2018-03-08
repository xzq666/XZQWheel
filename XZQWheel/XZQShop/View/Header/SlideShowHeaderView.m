//
//  SlideShowHeaderView.m
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/8.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import "SlideShowHeaderView.h"
#import <SDCycleScrollView.h>
#import "Useful_Define.h"

@interface SlideShowHeaderView ()<SDCycleScrollViewDelegate>

@property(nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation SlideShowHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

// UI
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    [self addSubview:_cycleScrollView];
}

// 图片数组
- (void)setImageGroupArray:(NSArray *)imageGroupArray {
    _imageGroupArray = imageGroupArray;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"default_160"];
    if (imageGroupArray.count == 0) {
        return;
    }
    _cycleScrollView.imageURLStringsGroup = _imageGroupArray;
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    AlertWithMessage([NSString stringWithFormat:@"点击了第%zd张轮播图", index]);
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
