//
//  SecondViewController.h
//  sme
//
//  Created by (dbx) Amigo on 12/12/26.
//  Copyright (c) 2012年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebDelegate.h"

@interface SecondViewController : UIViewController<UIWebViewDelegate>{
    NSString *myUrl;
    NSString *page;
    id<WebDelegate> webDelegate;
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) NSString *page;
@property (retain, nonatomic) NSString *myUrl;
@property (retain, nonatomic) id<WebDelegate> webDelegate;

- (id)initWithUrl:(NSString *)url;
- (IBAction)goBack:(id)sender;

@end
