//
//  SecondViewController.m
//  sme
//
//  Created by (dbx) Amigo on 12/12/26.
//  Copyright (c) 2012年 jason. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize page;
@synthesize myUrl;
@synthesize webDelegate;

- (id)initWithUrl:(NSString *)url
{
    self = [super initWithNibName:@"SecondViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.myUrl=url;
    }
    return self;
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    page=[[NSString alloc] init];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.myUrl]]];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    if ([[[request URL] lastPathComponent] isEqualToString:@"close_popup.php"]) {
        [webDelegate webRefresh];
        [self dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }
    
        return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
