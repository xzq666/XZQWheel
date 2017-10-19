//
//  XZQCountButton.m
//  MyWeel
//
//  Created by 许卓权 on 2017/10/19.
//  Copyright © 2017年 许卓权. All rights reserved.
//

#import "XZQCountButton.h"

typedef void(^ButtonClickedBlock)(void);
typedef void(^CountStartBlock)(void);
typedef void(^CountRunBlock)(NSInteger restCount);
typedef void(^CountCompleteBlock)(void);

@interface XZQCountButton() {
    NSInteger startCountNum; //倒计时开始值
    NSInteger restCountNum;  //倒计时剩余值
}

//计时器
@property(nonatomic,strong) NSTimer *timer;
//倒计时按钮点击回调
@property(nonatomic,copy) ButtonClickedBlock buttonClickedBlock;
//倒计时开始事件回调
@property(nonatomic,copy) CountStartBlock countStartBlock;
//倒计时计时事件回调
@property(nonatomic,copy) CountRunBlock countRunBlock;
//倒计时结束事件回调
@property(nonatomic,copy) CountCompleteBlock countCompleteBlock;

@end

@implementation XZQCountButton

- (instancetype)initWithDuration:(NSInteger)duration
                   buttonClicked:(void(^)(void))buttonClicked
                       counStart:(void(^)(void))countStart
                        countRun:(void(^)(NSInteger restCount))countRun
                    countComlete:(void(^)(void))countComplete {
    self = [super init];
    if (self) {
        startCountNum = duration;
        self.buttonClickedBlock = buttonClicked;
        self.countStartBlock = countStart;
        self.countRunBlock = countRun;
        self.countCompleteBlock = countComplete;
        [self addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//点击倒计时按钮
- (void)buttonClicked:(XZQCountButton *)sender {
    sender.enabled = NO;
    sender.buttonClickedBlock();
}

//开始倒计时
- (void)startCount {
    if (self.timer) {
        [self timerNil];
    }
    restCountNum = startCountNum;
    self.countStartBlock();
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshCountButton) userInfo:nil repeats:YES];
}

//刷新计时按钮
- (void)refreshCountButton {
    restCountNum--;
    self.countRunBlock(restCountNum);
    if (restCountNum == 0) {
        [self timerNil];
        restCountNum = startCountNum;
        self.countCompleteBlock();
        self.enabled = YES;
    }
}

//将计时器timer置空
- (void)timerNil {
    [self.timer invalidate];
    self.timer = nil;
}

@end
