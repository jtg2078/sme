//
//  ViewController.m
//  sme
//
//  Created by jason on 11/22/12.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "HomeViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize page;
@synthesize myUrl;



- (id)initWithUrl:(NSString *)url
{
    self = [super initWithNibName:@"ViewController" bundle:nil];
    if (self) {
        // Custom initialization
        self.myUrl=url;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    page=[[NSString alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.myUrl]]];
    
}
-(void)webRefresh{
    [self.myWebView reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myWebView release];
    [_topView release];
    [_navText release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setMyWebView:nil];
    [self setTopView:nil];
    [self setNavText:nil];
    [super viewDidUnload];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [SVProgressHUD showWithStatus:@"Loading"];
    });
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //NSString *urlStr=[[request URL] description];
    /*
    if ([[[request URL] lastPathComponent] isEqualToString:@"close_popup.php"]) {
       [_myWebView goBack];
    }
     */

    NSLog(@"%@",[request URL]);
    if ([[[request URL] lastPathComponent] isEqualToString:@"lecture.aspx"]) {
        _navText.text=@"行動演講廳";
    }
    if ([[[request URL] lastPathComponent] isEqualToString:@"news.aspx"]) {
        _navText.text=@"最新消息";
            }
    if ([[[request URL] lastPathComponent] isEqualToString:@"index.aspx"]) {
        _navText.text=@"活動說明";
    }
    if ([[[request URL] lastPathComponent] isEqualToString:@"course.aspx"]) {
        _navText.text=@"開課訊息";
    }
    if ([[[request URL] lastPathComponent] isEqualToString:@"quote.aspx"]) {
        _navText.text=@"名人金句";
    }
    if ([[[request URL] lastPathComponent] isEqualToString:@"description.aspx"]) {
        _navText.text=@"說明資訊";
    }
    if ([[[request URL] lastPathComponent] isEqualToString:@"Fans.aspx"]) {
        _navText.text=@"粉絲專區";
    }
  
    //http://m.facebook.com/login.php?
    
    if ([[[request URL] lastPathComponent] isEqualToString:@"login.php"])
    {
        SecondViewController *second = [[SecondViewController alloc] initWithUrl:[[request URL] description]];
        second.webDelegate=self;
        [self presentModalViewController:second animated:YES];
        return NO;
    }
  
    return YES;
}

- (IBAction)homeView:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
   // [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://smeonline.dbx.tw"]]];
                                  
}

- (IBAction)goBack:(id)sender {
    
    if ([_myWebView canGoBack]) {
        [_myWebView goBack];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //NSLog(@"%@",[error description]);
}

@end
