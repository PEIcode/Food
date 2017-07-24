//
//  PSTabbarcontroller.m
//  Food
//
//  Created by sunny&pei on 17/6/27.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//
#define random (r,g,b,255) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#import "PSTabbarcontroller.h"
#import "PSTabbar.h"
#import "PSTabbarButton.h"
#import "PSPublishController.h"
@interface PSTabbarcontroller ()<PSTabBarDelegate>

@end

@implementation PSTabbarcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    PSTabbar *mainTab = [[PSTabbar alloc]init];
    
    mainTab.delegate = self;
    mainTab.frame = self.tabBar.bounds;
    [self.tabBar addSubview:mainTab];
   
    for (int i=0; i<self.viewControllers.count; i++) {
//        int r = (arc4random() % 256);
//        int g = (arc4random() % 256);
//        int b = (arc4random() % 256);
        
//        PSTabbarButton *btn = [PSTabbarButton buttonWithType:UIButtonTypeCustom];
       
//        [btn setBackgroundColor:[UIColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:0.5]];

        //[btn setBackgroundColor:randomColor];
//        btn.backgroundColor = randomColor;
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_essence_icon"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] forState:UIControlStateSelected];
        NSString *name = [NSString stringWithFormat:@"tabBar%d",i + 1];
        NSString *selName = [NSString stringWithFormat:@"tabBar%dsel",i+1];
        [mainTab addTabButtonWithName:name selName:selName ];

    }
}

-(void)taBar:(PSTabbar *)tabBar didSelectButtonFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}
-(void)modalVc:(PSTabbarButton *)sender{
    PSPublishController *pubVc = [[PSPublishController alloc]init];
//    pubVc.view.backgroundColor = [UIColor whiteColor];
    pubVc.modalPresentationStyle = UIModalPresentationFullScreen;
    pubVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:pubVc animated:YES completion:nil];
}
@end
