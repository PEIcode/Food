//
//  PSIconBtn.m
//  Food
//
//  Created by sunny&pei on 2017/7/19.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSIconBtn.h"

@implementation PSIconBtn

+(PSIconBtn *)cutBtn{
    PSIconBtn *btn = [[PSIconBtn alloc]init];
    btn.layer.cornerRadius = 4.f;
    btn.layer.masksToBounds = YES;
    return btn;
}

@end
