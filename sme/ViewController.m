//
//  ViewController.m
//  sme
//
//  Created by jason on 11/22/12.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadHomePage:(BOOL)delayLoadingMessage
{
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile.smelearning.org.tw/home.aspx"]]];
    
    if(delayLoadingMessage == YES)
    {
        int64_t delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [SVProgressHUD showWithStatus:@"Loading"];
        });
    }
    else
    {
        [SVProgressHUD showWithStatus:@"Loading"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.trackedViewName = @"Main Screen(web view)";
    
    [self loadHomePage:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myWebView release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setMyWebView:nil];
    [super viewDidUnload];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    /*
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [SVProgressHUD showWithStatus:@"Loading"];
    });
     */
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [SVProgressHUD showErrorWithStatus:@"連線失敗, 請檢查您的網路或稍後再試"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}

@end
