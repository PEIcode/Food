//
//  UISearchBar+PS.h
//  Food
//
//  Created by sunny&pei on 2017/7/16.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (PS)
- (void)fm_setTextFont:(UIFont *)font;
- (void)fm_setTextColor:(UIColor *)textColor;
- (void)fm_setCancelButtonTitle:(NSString *)title;
/**
 *  设置取消按钮字体
 *
 *  @param font 字体
 */
- (void)fm_setCancelButtonFont:(UIFont *)font;
@end
