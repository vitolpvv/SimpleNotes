//
//  PSRAppDelegate.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRAppDelegate.h"
#import "PSRNoteManager.h"
#import "PSRMasterViewController.h"

@implementation PSRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[PSRNoteManager sharedManager] saveToFile];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PSRNoteManager sharedManager] saveToFile];
}

@end
