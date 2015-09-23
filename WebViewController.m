//
//  WebViewController.m
//  SampleATS
//
//  Created by satoutakeshi on 2015/09/23.
//  Copyright © 2015年 satoutakeshi. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // デリゲートを指定
    self.myWebView.delegate = self;
    
    // URLを指定
    NSURL *url = [NSURL URLWithString:@"http://afrel.pw"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // リクエストを投げる
    [self.myWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
