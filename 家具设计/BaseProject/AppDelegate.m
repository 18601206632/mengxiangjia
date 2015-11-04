//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TuijianNetModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [TuijianNetModel getPage:1 completionHandle:^(NSArray *models, NSError *error) {
//        NSLog(@"...");
//    }];
    
    [self initializeWithApplication:application];

    return YES;
}

@end
