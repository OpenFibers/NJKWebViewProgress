//
//  ViewController.m
//  WebViewDemo
//
//  Created by Satoshi Asano on 4/20/13.
//  Copyright (c) 2013 Satoshi Asano. All rights reserved.
//

#import "ViewController.h"
#import "NJKProgressWebView.h"

@interface ViewController ()<NJKProgressWebViewDelegate>
@end

@implementation ViewController
{
    UIWebView *_webView;
    IBOutlet __weak UIProgressView *_progressView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[NJKProgressWebView alloc] initWithFrame:(CGRect){CGPointZero, self.view.frame.size}];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    [self loadGoogle];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _webView.frame = (CGRect){CGPointZero, self.view.frame.size};
}

- (IBAction)searchButtonPushed:(id)sender
{
    [self loadGoogle];
}

- (IBAction)reloadButtonPushed:(id)sender
{
    [_webView reload];
}

-(void)loadGoogle
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://google.com/"]];
    [_webView loadRequest:req];
}

#pragma mark - NJKProgressWebViewDelegate
- (void)progressWebView:(NJKProgressWebView *)webView updateProgress:(float)progress
{
    if (progress == 0.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        _progressView.progress = 0;
        [UIView animateWithDuration:0.27 animations:^{
            _progressView.alpha = 1.0;
        }];
    }
    if (progress == 1.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [UIView animateWithDuration:0.27 delay:progress - _progressView.progress options:0 animations:^{
            _progressView.alpha = 0.0;
        } completion:nil];
    }
    
    [_progressView setProgress:progress animated:NO];
}

@end
