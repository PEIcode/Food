//
//  PSrouteViewController.m
//  Food
//
//  Created by sunny&pei on 2017/7/24.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSrouteViewController.h"
#import <WebKit/WebKit.h>
@interface PSrouteViewController ()


@end

@implementation PSrouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建WKWebView
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height ;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0,0,width,height)];
    //2.创建URL
    NSURL *URL = [NSURL URLWithString:@"http://www.tuniu.com/"];
    //3.创建Request
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //4.加载Request
    [webView loadRequest:request];
    //5.添加到视图
    [self.view addSubview:webView];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
