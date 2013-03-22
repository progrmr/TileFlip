//
//  TFAppDelegate.m
//  TileFlip
//
//  Created by Gary Morris on 11/27/11.
//  Copyright (c) 2011 Gary A. Morris. All rights reserved.
//

#import "TFAppDelegate.h"

#import "TFViewController.h"

@implementation TFAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[TFViewController alloc] initWithNibName:@"TFViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
