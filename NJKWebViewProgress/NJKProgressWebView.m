//
//  NJKProgressWebView.m
//  DemoApp
//
//  Created by openthread on 5/23/13.
//  Copyright (c) 2013 Satoshi Asano. All rights reserved.
//

#import "NJKProgressWebView.h"
#import "NJKWebViewProgress.h"

#if !__has_feature(objc_arc)
#error ARC is required
#endif

@interface NJKProgressWebView () <NJKWebViewProgressDelegate>
@end

@implementation NJKProgressWebView
{
    NJKWebViewProgress *_progressProxy;
    float _progress;
}
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _progressProxy = [[NJKWebViewProgress alloc] init];
        [super setDelegate:_progressProxy];
    }
    return self;
}

- (float)progress
{
    return _progress;
}

- (void)setDelegate:(id<NJKProgressWebViewDelegate>)delegate
{
    _delegate = delegate;
    [_progressProxy setWebViewProxyDelegate:delegate];
    [_progressProxy setProgressDelegate:self];
}

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    _progress = progress;
    if ([self.delegate respondsToSelector:@selector(progressWebView:updateProgress:)])
    {
        [self.delegate progressWebView:self updateProgress:progress];
    }
}

@end
