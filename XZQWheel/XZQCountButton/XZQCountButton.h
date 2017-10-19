//
//  XZQCountButton.h
//  MyWeel
//
//  Created by 许卓权 on 2017/10/19.
//  Copyright © 2017年 许卓权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZQCountButton : UIButton

/**
 初始化
 @param duration 倒计时时间
 @param buttonClicked 按钮点击事件的回调
 @param countStart 倒计时开始时的回调
 @param countRun 倒计时进行中的回调（每秒一次）
 @param countComplete 倒计时完成时的回调
 */
- (instancetype)initWithDuration:(NSInteger)duration
                   buttonClicked:(void(^)(void))buttonClicked
                       counStart:(void(^)(void))countStart
                        countRun:(void(^)(NSInteger restCount))countRun
                    countComlete:(void(^)(void))countComplete;

//开始倒计时
- (void)startCount;

@end
