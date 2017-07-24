//
//  PSTabbar.h
//  Food
//
//  Created by sunny&pei on 17/6/27.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSTabbar;
@class PSTabbarButton;
@protocol PSTabBarDelegate<NSObject>
@optional
-(void)taBar:(PSTabbar *)tabBar didSelectButtonFrom:(int)from to:(int)to;
@optional
-(void)modalVc:(PSTabbarButton *)sender;;
@end

@interface PSTabbar : UIView
@property (nonatomic,weak) id <PSTabBarDelegate> delegate;
/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
-(void )addTabButtonWithName:(NSString *)name selName:(NSString *)selName;
@end
