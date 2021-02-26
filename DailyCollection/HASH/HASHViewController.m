//
//  HASHViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/26.
//

#import "HASHViewController.h"

#import "NSString+Hash.h"

static NSString *salt = @"salt";

@interface HASHViewController ()

@end

@implementation HASHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *pwd = @"123456";
    
    //加盐 盐会泄露 不安全
    // 已有万亿条、PB级别的大数据库，可以碰撞查询出原值
//    pwd = [pwd stringByAppendingString:salt];
//    pwd = pwd.md5String;
    
    // HMAC加密方案
    // 使用一个秘钥进行加密，进行两次散列
    // 实际开发中，秘钥来自于服务器
    // 密码进行HASH后，可以拼接上分钟级时间戳再次HASH，可以实现密码的HASH时效性。
    pwd = [pwd hmacMD5StringWithKey:@"hmac"];
    
    NSLog(@"密码是:%@", pwd);
}

@end
