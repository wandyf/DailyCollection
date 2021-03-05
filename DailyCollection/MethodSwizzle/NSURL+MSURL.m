//
//  NSURL+MSURL.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/3/4.
//

#import "NSURL+MSURL.h"
#import <objc/runtime.h>

@implementation NSURL (MSURL)

+ (void)load {
    // 获取原方法
    Method URLWithString = class_getClassMethod(self, @selector(URLWithString:));
    // 获取自定义方法
    Method MS_URLWithString = class_getClassMethod(self, @selector(ms_URLWithString:));
    // 交换方法实现
    method_exchangeImplementations(URLWithString, MS_URLWithString);
}

+ (instancetype)ms_URLWithString:(NSString *)string {
    NSURL *url = [NSURL ms_URLWithString:string];
    if (!url) {
        string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    return [NSURL ms_URLWithString:string];
}

@end
