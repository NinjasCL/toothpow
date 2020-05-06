//
//  FDIAppDelegate.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 14-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "FDIAppDelegate.h"

@implementation FDIAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

@end
