//
//  TopToolView.h
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/7.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopToolView : UIView

@property(nonatomic, copy) dispatch_block_t leftItemClickBlock;
@property(nonatomic, copy) dispatch_block_t rightItemFirstClickBlock;
@property(nonatomic, copy) dispatch_block_t rightItemSecondClickBlock;
@property(nonatomic, copy) dispatch_block_t searchButtonClickBlock;
@property(nonatomic, copy) dispatch_block_t voiceButtonClickBlock;

@end
