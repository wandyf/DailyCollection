//
//  AppDelegate.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "AppDelegate.h"

#import "BaseNavigationController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [UIWindow.alloc initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *mainVC = [MainViewController.alloc init];
    BaseNavigationController *rootNav = [BaseNavigationController.alloc initWithRootViewController:mainVC];
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
