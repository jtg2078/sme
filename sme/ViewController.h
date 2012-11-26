//
//  ViewController.h
//  sme
//
//  Created by jason on 11/22/12.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"


@interface ViewController : GAITrackedViewController <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *myWebView;

@end
