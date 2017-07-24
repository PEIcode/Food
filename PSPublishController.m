//
//  PSPublishController.m
//  Food
//
//  Created by sunny&pei on 2017/7/17.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPublishController.h"
#import "PSPubButton.h"
#import "PSPubWordViewController.h"
@interface PSPublishController ()

@end

@implementation PSPublishController
-(void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        // 添加发布按钮
        [self addPubButton];
        
    } completion:nil];
//    [UIView animateWithDuration:3.0 animations:^{
//       
//        
//        // 添加发布按钮
//        [self addPubButton];
//        //添加返回按钮
//        [self addBackButton];
//    }];
//    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 获取系统时间 变为标签
    [self addLabel];
    
    //添加返回按钮
    [self addBackButton];
    
}
-(void)addLabel{
    //设置年月日和星期的标签
    UILabel *dayLb = [[UILabel alloc]init];
    dayLb.frame = CGRectMake(50, 80, 70, 80);
//    dayLb.backgroundColor = [UIColor redColor];
    
    UILabel *weekLb = [[UILabel alloc]init];
    weekLb.frame = CGRectMake(130, 85, 70, 40);
//    weekLb.backgroundColor = [UIColor greenColor];
    
    UILabel *yearLb = [[UILabel alloc]init];
    yearLb.frame = CGRectMake(130, 115, 70, 40);
//    yearLb.backgroundColor = [UIColor grayColor];
    //添加广告图片
    
    
    // 获取当前时间
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyy"];
    NSString *  yearString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"MM"];
    NSString *  monthString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"dd"];
    NSString *  dayString = [dateformatter stringFromDate:senddate];
    [dateformatter setDateFormat:@"EEE"];
    
    NSString *  weekString = [dateformatter stringFromDate:senddate];
    
    int year = [yearString intValue];
    
    int month = [monthString intValue];
    
    int day = [dayString intValue];
    //字符串的转化并且拼接
    NSString *yearstr=[NSString stringWithFormat:@"%ld",(long)year];
    NSString *monthstr=[NSString stringWithFormat:@"%ld",(long)month];
    NSString *daystr=[NSString stringWithFormat:@"%ld ",(long)day];
    
    NSString *yearAndMon = [NSString stringWithFormat:@"%@/%@",monthstr,yearstr];
    //设置标签具体内容及其样式
    dayLb.text = daystr;
    dayLb.font = [UIFont fontWithName:@"ArialMT" size:62];
    dayLb.textColor = [UIColor grayColor];
    dayLb.textAlignment = NSTextAlignmentCenter;
    
    weekLb.text = weekString;
    weekLb.textAlignment = NSTextAlignmentLeft;
    
    yearLb.text =yearAndMon;
    yearLb.textAlignment = NSTextAlignmentLeft;
    
    // 添加到View
    [self.view addSubview:dayLb];
    [self.view addSubview:weekLb];
    [self.view addSubview:yearLb];
}
-(void)addPubButton{
//    PSPubButton * pubBtn = [[PSPubButton alloc]init];
//    pubBtn.frame = CGRectMake(54.6, 370, 125, 125);
    PSPubButton *wordPubBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(54.6, 370, 125, 125) title:@"文字" titleColor:[UIColor grayColor]  titleFont:18 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"pub_word"] imageViewContentMode:UIViewContentModeCenter];
    [self.view addSubview:wordPubBtn];
    //监听按钮点击
    [wordPubBtn addTarget:self action:@selector(pubWordClick:) forControlEvents:UIControlEventTouchDown];
    
    
    PSPubButton *picPubBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(234.3, 370, 125, 125) title:@"图片" titleColor:[UIColor grayColor]  titleFont:18 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"pub_pic"] imageViewContentMode:UIViewContentModeCenter];
    [self.view addSubview:picPubBtn];
    
    PSPubButton *videoPubBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(54.6, 534, 125, 125) title:@"视频" titleColor:[UIColor grayColor]  titleFont:18 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"pub_video"] imageViewContentMode:UIViewContentModeCenter];
    [self.view addSubview:videoPubBtn];
    
    PSPubButton *livePubBtn = [PSPubButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(234.3, 534, 125, 125) title:@"直播" titleColor:[UIColor grayColor]  titleFont:18 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"pub_live"] imageViewContentMode:UIViewContentModeCenter];
    [self.view addSubview:livePubBtn];
    
    
}
-(void)addBackButton{
    UIButton *backBtn = [[UIButton alloc]init];
    backBtn.frame = CGRectMake(177, 675, 60, 60);
    [backBtn setImage:[UIImage imageNamed:@"pub_backBtn"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchDown];
}
- (void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)pubWordClick:(id)sender{
    PSPubWordViewController *vc = [[PSPubWordViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalTransitionStyle =UIModalTransitionStyleCoverVertical;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
