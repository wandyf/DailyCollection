//
//  BaseViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    self.view.backgroundColor = UIColor.whiteColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end
