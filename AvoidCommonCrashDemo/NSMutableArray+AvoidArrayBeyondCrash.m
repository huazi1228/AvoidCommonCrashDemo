//
//  NSMutableArray+AvoidArrayBeyondCrash.m
//  AvoidCommonCrashDemo
//
//  Created by j1 on 17/2/27.
//  Copyright © 2017年 j1. All rights reserved.
//

#import "NSMutableArray+AvoidArrayBeyondCrash.h"
#import <objc/runtime.h>
@implementation NSMutableArray (AvoidArrayBeyondCrash)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method objectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method swizzleObjectAtIndex =class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(swizzleObjectAtIndex:));
        method_exchangeImplementations(objectAtIndex, swizzleObjectAtIndex);
    });
}


- (id)swizzleObjectAtIndex:(NSUInteger)index
{
    if (index < self.count)
    {
        return [self swizzleObjectAtIndex:index];
    }
    NSLog(@"%@ 越界",self);
    return nil;//越界返回为nil
}

@end
