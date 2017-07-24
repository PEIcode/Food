//
//  PSPubButton.m
//  Food
//
//  Created by sunny&pei on 2017/7/21.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSPubButton.h"
#define kTitleRatio 0.2
@implementation PSPubButton
+(instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont textAlignment:(NSTextAlignment)textAlignment image:(UIImage *)image imageViewContentMode:(UIViewContentMode *)imageViewContentMode{
    
    PSPubButton *button = [ super buttonWithType:buttonType];

    //button的frame
    button.frame = frame;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    
    return button;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgW = contentRect.size.width;
    CGFloat imgH = contentRect.size.height * (1-kTitleRatio);
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleH = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleH;
    CGFloat titleW = contentRect.size.width;
    
    
    return CGRectMake(titleX , titleY  , titleW, titleH);
    
}
@end
