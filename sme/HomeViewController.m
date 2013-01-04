//
//  HomeViewController.m
//  sme
//
//  Created by (dbx) Amigo on 12/12/25.
//  Copyright (c) 2012年 jason. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view from its nib.
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile1.smelearning.org.tw"]]];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *urlStr=[[request URL] description];
    NSLog(@"%@",urlStr);
    if ([[[request URL] lastPathComponent] isEqualToString:@"close_popup.php"]) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile1.smelearning.org.tw"]]];
    }
    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/news.aspx?p=1"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }
    
    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/lecture.aspx?p=1"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }

    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/course.aspx"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }

    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/quote.aspx?p=1"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }
    
    
    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/description.aspx"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }
    
    if([urlStr isEqualToString:@"http://mobile1.smelearning.org.tw/Fans.aspx"]){
        ViewController *docView=[[ViewController alloc] initWithUrl:urlStr];
        [self.navigationController pushViewController:docView animated:YES];
        [docView release];
        return NO;
    }

     /*
     if ([[[request URL] lastPathComponent] isEqualToString:@"index.aspx"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     if ([[[request URL] lastPathComponent] isEqualToString:@"news.aspx"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     if ([[[request URL] lastPathComponent] isEqualToString:@"course.aspx"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     if ([[[request URL] lastPathComponent] isEqualToString:@"quote.aspx"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     if ([[[request URL] lastPathComponent] isEqualToString:@"description.aspx"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     if ([[[request URL] lastPathComponent] isEqualToString:@"facebook"]) {
     [_topView setCenter:CGPointMake(160, -82)];
     [self.myWebView setFrame:CGRectMake(0, 0, 320, 548)];
     }
     */
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
