//
//  PSTabbar.m
//  Food
//
//  Created by sunny&pei on 17/6/27.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTabbar.h"
#import "PSTabbarButton.h"
#import "PSPublishController.h"
@interface PSTabbar()
/**
 *  纪录当前选中的按钮
 */
@property (nonatomic , weak) PSTabbarButton *selectBtn;
@end
@implementation PSTabbar

-(void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName{
    PSTabbarButton  *btn = [[PSTabbarButton alloc]init];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar-light"] forState:UIControlStateNormal];
    
    [self addSubview:btn];
    if ([name isEqualToString:@"tabBar2"]) {
        [btn addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchDown];
    }else {
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    }
    
  
    //默认选中第0个按钮
    if (self.subviews.count == 1){
        [self btnClick:btn];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    long int count = self.subviews.count;
    for (int i = 0; i<count; i++) {
        PSTabbarButton *btn = self.subviews[i];
        btn.tag = i;
        CGFloat btnW = self.frame.size.width /3;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
//        if (i==1) {
//            [btn addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchDown];
//        }
    }
    
}
-(void)btnClick:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(taBar:didSelectButtonFrom:to:)]){
        [self.delegate taBar:self didSelectButtonFrom:self.selectBtn.tag to:btn.tag];
        
    }
    self.selectBtn.selected = NO;
    btn.selected = YES;
    _selectBtn=btn;
    
}
-(void)btn2Click:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(modalVc:)]){
        [self.delegate modalVc:btn];
    }
}
@end
