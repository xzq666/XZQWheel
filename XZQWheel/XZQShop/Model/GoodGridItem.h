//
//  GoodGridItem.h
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/8.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodGridItem : NSObject

// 图片
@property(nonatomic, copy, readonly) NSString *iconImage;
// 文字
@property(nonatomic, copy, readonly) NSString *gridTitle;
// 标签
@property(nonatomic, copy, readonly) NSString *gridTag;
// 标签颜色
@property(nonatomic, copy, readonly) NSString *gridColor;

@end
