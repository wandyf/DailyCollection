//
//  FishHookViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/3/16.
//

#import "FishHookViewController.h"

// fishhook在运行时，动态获取函数地址
#import "fishhook.h"

@interface FishHookViewController ()

@end

@implementation FishHookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // HOOK -- NSLog函数
    
    // 指定交换的函数
    struct rebinding nslog;
    nslog.name = "NSLog";
    nslog.replacement = myNSLog;
    nslog.replaced = (void *)&sys_nslog;
    
    
    // 结构体数组
    struct rebinding rebs[1] = {nslog};
    
    /**
     * 用于交换C函数
     * arg1:存放rebiding结构体的数组
     * arg2:数组内结构体数量
     */
    rebind_symbols(rebs, 1);
}

// 定义用于交换的新函数
// 注意，C函数的名称，就是函数的指针!
void myNSLog(NSString * format,...) {
    format = [format stringByAppendingFormat:@"\n你被hook了。🍺🍺🍺"];
    sys_nslog(format);
}

// 定义函数指针，用于保存原始函数地址
static void(*sys_nslog)(NSString * format,...);

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击屏幕");
}

@end
