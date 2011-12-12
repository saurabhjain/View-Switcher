//
//  View_SwitcherAppDelegate.h
//  View Switcher
//
//  Created by Saurabh Jain on 12/11/11.
//  Copyright 2011 USC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchViewController;
@interface View_SwitcherAppDelegate : NSObject <UIApplicationDelegate> {
    
    IBOutlet UIWindow *window;
    IBOutlet SwitchViewController *switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) SwitchViewController *swicthViewController;

@end
