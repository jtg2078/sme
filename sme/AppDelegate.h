//
//  AppDelegate.h
//  sme
//
//  Created by jason on 11/22/12.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (assign, nonatomic) BOOL showHomePage;

@end
