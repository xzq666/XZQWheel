//
//  Useful_Define.h
//  XZQWheel
//
//  Created by 许卓权 on 2018/2/12.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#ifndef Useful_Define_h
#define Useful_Define_h

/***************************系统版本*****************************/
// 获取手机系统的版本
#define CurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
// 是否为iOS7及以上系统
#define ISiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
// 是否为iOS8及以上系统
#define ISiOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
// 是否为iOS9及以上系统
#define ISiOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
// 是否为iOS10及以上系统
#define ISiOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
// 是否为iOS11及以上系统
#define ISiOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)

/***************************沙盒路径*****************************/
// 沙盒路径
#define HomePath NSHomeDirectory()
// 获取沙盒 Document
#define PathForDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
// 获取沙盒 Cache
#define PathForCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
// 获取沙盒 temp
#define PathForTemp NSTemporaryDirectory()

/***************************打印日志*****************************/
// 输出语句
#ifdef DEBUG
# define NSLog(FORMAT, ...) printf("[%s<%p>行号:%d]:\n%s\n",__FUNCTION__,self,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
# define NSLog(FORMAT, ...)
#endif

/***************************系统高度*****************************/
// 屏幕的宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 屏幕大小
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
// 比例宽和高(以6s为除数)
#define ActureHeight(height)  roundf(height/375.0 * SCREEN_WIDTH)
#define ActureWidth(Width)  roundf(Width/667.0 * SCREEN_HEIGHT)
// 状态栏的高度
#define StatusBar_Height [[UIApplication sharedApplication] statusBarFrame].size.height
// 导航栏的高度
#define NavBar_Height 44.0
// iphoneX-SafeArea的高度
#define SafeArea_Height ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)
// 分栏+iphoneX-SafeArea的高度
#define TabBar_Height (49+SafeArea_Height)
// 导航栏+状态栏的高度
#define Top_Height (StatusBar_Height + NavBar_Height)

/***************************通知和本地存储*****************************/
//创建通知
#define Add_Notification(selectorName,key) [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectorName) name:key object:nil];
//发送通知
#define Send_Notification(key) [[NSNotificationCenter defaultCenter] postNotificationName:key object:self userInfo:nil];
//移除通知
#define Remove_Notification(key) [[NSNotificationCenter defaultCenter]removeObserver:self name:key object:nil];

/**************************视图**************************/
//View圆角和加边框
#define ViewBorderRadius(View,Radius,Width,Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
// View圆角
#define ViewRadius(View,Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#endif
