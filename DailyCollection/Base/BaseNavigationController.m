//
//  BaseNavigationController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate>
 
@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ( gestureRecognizer == self.interactivePopGestureRecognizer ) {
        if ( self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers.firstObject ){
            return NO;
        }
    }
    return YES;
}

@end
