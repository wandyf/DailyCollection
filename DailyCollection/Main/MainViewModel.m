//
//  MainViewModel.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "MainViewModel.h"

#import "RSAViewController.h"
#import "HASHViewController.h"
#import "EncryptionViewController.h"
#import "MetodSwizzleViewController.h"

@implementation MainViewModel

- (NSArray *)vcArray {
    if (!_vcArray) {
        _vcArray = @[@{@"name":RSAViewController.identifier,@"desc":@"RSA加密与解密"},
                     @{@"name":HASHViewController.identifier,@"desc":@"HASH算法"},
                     @{@"name":EncryptionViewController.identifier,@"desc":@"对称加密"},
                     @{@"name":MetodSwizzleViewController.identifier,@"desc":@"MethodSwizzle，方法交换"}];
    }
    return _vcArray;
}

@end
