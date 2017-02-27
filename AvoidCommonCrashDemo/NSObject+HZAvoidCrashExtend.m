//
//  NSObject+HZAvoidCrashExtend.m
//  AvoidCommonCrashDemo
//
//  Created by j1 on 17/2/27.
//  Copyright © 2017年 j1. All rights reserved.
//

#import "NSObject+HZAvoidCrashExtend.h"
#import <objc/runtime.h>
@implementation NSObject (HZAvoidCrashExtend)
//执行转发后的方法
- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self respondsToSelector:invocation.selector]) {
        
    }
    else{
        [self errorCatch:NSStringFromSelector(invocation.selector)];
    }
    
}
//转发的方法签名
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([self respondsToSelector:sel]) {
        return [NSObject instanceMethodSignatureForSelector:@selector(errorCatch:)];
    }
    return [self methodSignatureForSelector:@selector(errorCatch:)];
}
- (void)errorCatch:(NSString *)str {
    NSLog(@"%@类调用了没有被实现的%@方法",NSStringFromClass(self.class),str);
}

@end
