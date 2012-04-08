//
//  TVAppController.h
//  TextViewLink
//
//  Created by Oropon on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TVViewController;

@interface TVAppController : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow*         window;
@property (strong, nonatomic) TVViewController* viewController;

// Initialize
+ (TVAppController*)sharedController;

@end