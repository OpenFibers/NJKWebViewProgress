//
//  NJKProgressWebView.h
//  DemoApp
//
//  Created by openthread on 5/23/13.
//  Copyright (c) 2013 Satoshi Asano. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NJKProgressWebView;

@protocol NJKProgressWebViewDelegate <UIWebViewDelegate>

- (void)progressWebView:(NJKProgressWebView *)webView updateProgress:(float)progress;

@end

@interface NJKProgressWebView : UIWebView

@property (nonatomic, readonly) float progress;
@property (nonatomic, assign) id<NJKProgressWebViewDelegate> delegate;

@end
