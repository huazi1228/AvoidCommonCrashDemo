//
//  AppDelegate.m
//  AvoidCommonCrashDemo
//
//  Created by j1 on 17/2/27.
//  Copyright © 2017年 j1. All rights reserved.
//

#import "AppDelegate.h"
#import "NSObject+HZAvoidCrashExtend.h"
#import "NSArray+AvoidArrayBeyondCrash.h"
#import "Student.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self testObjectNoImplementMethod];
    
    [self testArrayBeyond];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self testObjectNoImplementMethod];
    
    [self testArrayBeyond];

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/*
     我们调用A类中没有实现的某个方法
 */
- (void)testObjectNoImplementMethod {
    Student *s1 =[[Student alloc] init];
    [s1 study];
    [s1 noImplementMethod];
    
    NSObject *o1 =[[NSObject alloc] init];
    [(Student *)o1 study];
    
}
- (void)testArrayBeyond {
    NSArray *a1 =[[NSArray alloc] initWithObjects:@"2",@"3",@"4",@"5",@"6",@"4",@"5",@"6", nil];
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text =[a1 objectAtIndex:14];
    label.textColor =[UIColor blackColor];
    [self.window addSubview:label];
    NSLog(@"数组%@",[a1 objectAtIndex:14]);
}
@end
