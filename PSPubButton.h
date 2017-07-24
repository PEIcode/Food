//
//  PSPubButton.h
//  Food
//
//  Created by sunny&pei on 2017/7/21.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPubButton : UIButton
+(instancetype)buttonWithType:(UIButtonType)buttonType frame: (CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont textAlignment:(NSTextAlignment )textAlignment image:(UIImage *)image imageViewContentMode:(UIViewContentMode *)imageViewContentMode ;

@end
