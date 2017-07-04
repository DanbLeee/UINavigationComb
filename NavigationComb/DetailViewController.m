//
//  DetailViewController.m
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/15.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import "DetailViewController.h"
#import "ModalViewController.h"
#import <WebKit/WebKit.h>

@interface DetailViewController () <WKNavigationDelegate>

@property (strong,nonatomic) WKWebView *webView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏添加按钮
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    //添加WKWebView
    _webView = [[WKWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    //网址导入
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

//模态视图跳转
- (void)add:(id)sender{
    
    ModalViewController *modalViewController = [[ModalViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:modalViewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark -- WKNavigationDelegate委托协议
//开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载");
}
//当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"内容开始返回");
}
//加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}
//加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败 error :  %@", error.description);
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
