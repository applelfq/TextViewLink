//
//  TVApplication.m
//  TextViewLink
//
//  Created by Oropon on 12/04/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TVApplication.h"
#import "TVAppController.h"

@implementation TVApplication
{
    NSURL*     _url;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (actionSheet.tag) {
        // For opening url
        case 0:
            // Check url
            if (!_url) {
                break;
            }
            
            // Invoke super
            [super openURL:_url];
            
            // Release instance variable
            [_url release], _url = nil;

            break;
        default:
            break;
    }

}

- (BOOL)openURL:(NSURL *)url
{
    // Set url
    [_url release];
    _url = [[NSURL URLWithString:[url absoluteString]] retain];
    
    // Get confirmatory message
    NSString*   message;
    NSString*   scheme;
    scheme = _url.scheme;
    if ([scheme isEqualToString:@"http"] ||
        [scheme isEqualToString:@"https"] ||
        [scheme isEqualToString:@"ftp"]) {
        message = @"Safariで開く";
    }
    else if ([scheme isEqualToString:@"mailto"]) {
        message = @"メールを作成する";
    }
    else if ([scheme isEqualToString:@"maps"]) {
        message = @"マップを開く";
    }
    else {
        return NO;
    }
    
    // Create action sheet
    UIActionSheet*  sheet;
    sheet = [[UIActionSheet alloc] init];
    [sheet addButtonWithTitle:message];
    [sheet addButtonWithTitle:@"キャンセル"];
    sheet.cancelButtonIndex = sheet.numberOfButtons - 1;
    sheet.tag = 0;
    sheet.delegate = self;
    
    // Show sheet
    [sheet showInView:[TVAppController sharedController].window];
    
    // Release sheet
    [sheet release];

    return YES;
}

@end
