//
//  WKWebViewController.m
//  SampleATS
//
//  Created by satoutakeshi on 2015/09/23.
//  Copyright © 2015年 satoutakeshi. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong)WKWebView *webView;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //WKWebViewのインスタンス化
    self.webView = [WKWebView new];
    
    //Auto Layout設定
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;

    // デリゲートにこのビューコントローラを設定する
    self.webView.navigationDelegate = self;
    
    // フリップでの戻る・進むを有効にする
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    // WKWebView インスタンスを画面に配置する
    [self.view addSubview:self.webView];
    
}

-(void) updateViewConstraints
{
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1
                                                              constant:0]
                                ]];
    
    [super updateViewConstraints];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    // 初回画面表示時にWeb ページを読み込む
    NSURL *url = [NSURL URLWithString:@"http://afrel.pw"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ページは見つかったが読み込みができなかった場合呼ばれる
- (void)webView:(WKWebView * _Nonnull)webView
didFailNavigation:(WKNavigation * _Null_unspecified)navigation
      withError:(NSError * _Nonnull)error
{
    NSLog(@"%s", __func__);
}

//ページが見つかり、読み込み開始に呼ばれる
- (void)webView:(WKWebView * _Nonnull)webView
didCommitNavigation:(WKNavigation * _Null_unspecified)navigation
{
    NSLog(@"%s", __func__);
}

//ページの読み込み準備失敗に呼ばれる
- (void)webView:(WKWebView * _Nonnull)webView
didFailProvisionalNavigation:(WKNavigation * _Null_unspecified)navigation
      withError:(NSError * _Nonnull)error
{
    NSLog(@"%@", error);
}

//ページの読み込み完了
- (void)webView:(WKWebView * _Nonnull)webView
didFinishNavigation:(WKNavigation * _Null_unspecified)navigation
{
    NSLog(@"%s", __func__);
}

//ページの読み込み開始で呼ばれる
- (void)webView:(WKWebView * _Nonnull)webView
didStartProvisionalNavigation:(WKNavigation * _Null_unspecified)navigation
{
    NSLog(@"%s", __func__);
}



@end
