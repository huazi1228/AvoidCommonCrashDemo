//
//  NSArray+AvoidArrayBeyondCrash.m
//  AvoidCommonCrashDemo
//
//  Created by j1 on 17/2/27.
//  Copyright © 2017年 j1. All rights reserved.
//

#import "NSArray+AvoidArrayBeyondCrash.h"
#import <objc/runtime.h>
@implementation NSArray (AvoidArrayBeyondCrash)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method objectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method swizzleObjectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(swizzleObjectAtIndex:));
        method_exchangeImplementations(objectAtIndex, swizzleObjectAtIndex);
    });
}


- (id)swizzleObjectAtIndex:(NSUInteger)index
{
    if (index < self.count)
    {
        return [self swizzleObjectAtIndex:index];
    }
    NSLog(@"%@ 数组越界",self);
    return nil;// 越界返回为nil
}
@end
