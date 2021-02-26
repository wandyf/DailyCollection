//
//  EncryptionViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/26.
//

#import "EncryptionViewController.h"

#import "EncryptionTools.h"

@interface EncryptionViewController ()

@end

@implementation EncryptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // AES ECB模式 iv环境变量传nil
//    NSString *key = @"abc";
//    NSString *encStr = [[EncryptionTools sharedEncryptionTools] encryptString:@"明文" keyString:key iv:nil];
//    NSLog(@"加密结果:%@", encStr);
//    NSString *dencStr = [[EncryptionTools sharedEncryptionTools] decryptString:encStr keyString:key iv:nil];
//    NSLog(@"解密结果:%@", dencStr);
    
    
    // AES CBC模式
    NSString *key = @"abc";
    uint8_t iv[8] = {1,2,3,4,5,6,7,8};
    NSData *ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    NSString *encStr = [[EncryptionTools sharedEncryptionTools] encryptString:@"明文" keyString:key iv:ivData];
    NSLog(@"加密结果:%@", encStr);
    NSString *dencStr = [[EncryptionTools sharedEncryptionTools] decryptString:encStr keyString:key iv:ivData];
    NSLog(@"解密结果:%@", dencStr);
}


@end
