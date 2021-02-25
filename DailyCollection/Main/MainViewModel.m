//
//  MainViewModel.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "MainViewModel.h"

#import "RSAViewController.h"

@implementation MainViewModel

- (NSArray *)vcArray {
    if (!_vcArray) {
        _vcArray = @[@{@"name":RSAViewController.identifier,@"desc":@"RSA加密与解密"}];
    }
    return _vcArray;
}

@end
