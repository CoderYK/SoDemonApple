//
//  AppDelegate.m
//  SoDemonApple
//
//  Created by sandy on 16/5/10.
//  Copyright © 2016年 sandy. All rights reserved.
//

#import "AppDelegate.h"
#import "IPCamMgr.h"
#import "IPCam.h"
#import "Storage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(void)loadAllCameras{
    NSArray * ipcamList = [[Storage get_share]get_cameras_list];
    IPCamMgr * ipcamMgr = [IPCamMgr get_share];
    IPCam * cam;
    for (int i = 0; i< ipcamList.count; i++) {
        NSDictionary * camera = [ipcamList objectAtIndex:i];
        cam = [ipcamMgr add_camera:[camera objectForKey:@"camera_id"] alias:[camera objectForKey:@"alias"] user:[camera objectForKey:@"user"] pwd:[camera objectForKey:@"pwd"] https:[[camera objectForKey:@"https"] boolValue]];
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [IPCamMgr  get_share];
    [[Storage get_share]update_user:@"sandy" login_type:0 auth_name:nil auth_pwd:nil alias:nil];
    [[Storage get_share]set_current_user:@"sandy"];
    [self loadAllCameras];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[IPCamMgr get_share]stop];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[IPCamMgr get_share]start];

}

- (void)applicationWillTerminate:(UIApplication *)application {

    [IPCamMgr release_share];
}

@end
