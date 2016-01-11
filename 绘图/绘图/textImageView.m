//
//  textImageView.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "textImageView.h"

@implementation textImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawTextImage{
    CGContextRef txt = UIGraphicsGetCurrentContext();
    //绘制一个矩形区域
    CGRect rect = CGRectMake(50, 50, 200, 200);
    CGContextAddRect(txt, rect);
    [[UIColor cyanColor]set];
    CGContextDrawPath(txt, kCGPathFillStroke);
    
    NSString *str = @"可怜巴巴的小金毛";
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor purpleColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    [str drawInRect:rect withAttributes:attr];
}
- (void)drawRect:(CGRect)rect {
    [self drawTextImage];

}

@end
