//
//  AppDelegate.m
//  XZQWheel
//
//  Created by 许卓权 on 2017/10/19.
//  Copyright © 2017年 许卓权. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ContactViewController.h"
#import "JPFPSStatus.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 初始化一个tabBar控制器并设置为根控制器
    UITabBarController *tb = [[UITabBarController alloc] init];
    self.window.rootViewController = tb;
    
    // 创建子控制器
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.tabBarItem.title = @"效果展示";
    [tb addChildViewController:nav1];
    
    ContactViewController *vc2 = [[ContactViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"联系方式";
    [tb addChildViewController:nav2];
    
    // 设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    
#if defined(DEBUG)||defined(_DEBUG) //在模拟器上测试时才显示FPS
    [[JPFPSStatus sharedInstance] open];
#endif
    
    // 适配iOS11
    [self fixToiOS11];
    
    return YES;
}

// 适配iOS11
- (void)fixToiOS11 {
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
