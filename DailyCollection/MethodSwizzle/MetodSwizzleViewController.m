//
//  MetodSwizzleViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/3/4.
//

#import "MetodSwizzleViewController.h"

@interface MetodSwizzleViewController ()

@end

@implementation MetodSwizzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 利用MethodSwizzle处理URL中文编码
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/中文"];
    NSLog(@"%@", url);
}

@end
