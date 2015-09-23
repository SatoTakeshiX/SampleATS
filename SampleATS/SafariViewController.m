//
//  SafariViewController.m
//  SampleATS
//
//  Created by satoutakeshi on 2015/09/22.
//  Copyright © 2015年 satoutakeshi. All rights reserved.
//

#import "SafariViewController.h"
@import SafariServices;

@interface SafariViewController ()<SFSafariViewControllerDelegate>
- (IBAction)displaySafari:(UIButton *)sender;

@end

@implementation SafariViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)displaySafari:(UIButton *)sender {
    
    
    if (![SFSafariViewController class]) {
        
        [self displayAlertView];
        
        return;
    }
    
    SFSafariViewController *safariViewCon = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:@"http://afrel.pw"]];
    
    [self presentViewController:safariViewCon
                       animated:YES
                     completion:nil];
    
    safariViewCon.delegate = self;
     
}


#pragma mark - SFSafariViewControllerDelegate
-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    NSLog(@"WebPageを見終わりました");
}

-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully
{
    NSLog(@"ページをロードしました。これは最初に呼ばれるメソッドです");
}

- (NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller
                            activityItemsForURL:(NSURL *)URL
                                          title:(nullable NSString *)title;
{
    NSLog(@"URL:%@, Title:%@", URL, title);
    UIActivity *activity = [[UIActivity alloc] init];
    return @[activity];
}

-(void)displayAlertView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"SFSafariViewが使えない端末です。" preferredStyle:UIAlertControllerStyleAlert];
    
    //ボタンの追加
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
