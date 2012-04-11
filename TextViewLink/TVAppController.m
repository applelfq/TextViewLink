//
//  TVAppController.m
//  TextViewLink
//
//  Created by Oropon on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TVAppController.h"
#import "TVViewController.h"

@implementation TVAppController

@synthesize window = _window;
@synthesize viewController = _viewController;

/* ============================================================ */
#pragma mark - Initialize -
/* ============================================================ */

static TVAppController* _sharedInstance;

+ (TVAppController*)sharedController
{
    if (!_sharedInstance) {
        [self init];
    }
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _sharedInstance = self;

    return self;
}

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
    self.viewController = [[[TVViewController alloc] initWithNibName:@"TVViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
@end