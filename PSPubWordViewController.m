//
//  PSPubWordViewController.m
//  Food
//
//  Created by sunny&pei on 2017/7/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPubWordViewController.h"

@interface PSPubWordViewController ()

@end

@implementation PSPubWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UINavigationController *navVc = [[UINavigationController alloc]init];
//    navVc.view.backgroundColor = [UIColor redColor];
//    self.navigationItem.title = @"hah";
    //创建一个导航栏
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
   
    [self.view addSubview:navigationBar];
    //创建导航控件内容
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"发动态"];
    
    //左侧添加取消按钮
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    navigationItem.leftBarButtonItem=cancelBtn;
    //右侧添加发布按钮
    UIBarButtonItem *surelBtn=[[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    navigationItem.rightBarButtonItem=surelBtn;
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //添加发布栏
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(0, 50, 414, 686)];
//    textFiled.backgroundColor = [UIColor redColor];
    textFiled.textAlignment = NSTextAlignmentLeft;
    textFiled.placeholder = @"分享最新动态...";
    textFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textFiled];
}
-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)sure{
    NSLog(@"发布啦！！");
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
