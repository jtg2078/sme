//
//  ViewController.h
//  sme
//
//  Created by jason on 11/22/12.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebDelegate.h"

@interface ViewController : UIViewController <UIWebViewDelegate,WebDelegate>{
    
    NSString *myUrl;
    NSString *page;
}

@property (retain, nonatomic) IBOutlet UIWebView *myWebView;
@property (retain, nonatomic) IBOutlet UIView *topView;
@property (retain, nonatomic) NSString *page;
@property (retain, nonatomic) NSString *myUrl;
@property (retain, nonatomic) IBOutlet UILabel *navText;

- (id)initWithUrl:(NSString *)url;
- (IBAction)homeView:(id)sender;
- (IBAction)goBack:(id)sender;

@end
