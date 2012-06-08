//
//  ViewController.m
//  SetUserAgentOfUIWebView
//
//  Created by James Border on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)initUIWebView;
@end

@implementation ViewController

- (void) initUIWebView {
	
	//	init and create the UIWebView
	UIWebView *aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[aWebView setAutoresizesSubviews:YES];	
	[aWebView setDelegate:self];
	
	//Set the URL to go to for your UIWebView
	NSString *urlAddress = @"http://whatsmyuseragent.com/";
	
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:urlAddress];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//load the URL into the web view.
	[aWebView loadRequest:requestObj];
	
	//add the web view to the content view
	[self.view addSubview:aWebView];
	
	aWebView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	NSString *errorString = [NSString stringWithFormat: @"<html><center><br><br>Error:<br>%@</center></html>", error.localizedDescription];
	[webView loadHTMLString:errorString baseURL:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initUIWebView];
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
