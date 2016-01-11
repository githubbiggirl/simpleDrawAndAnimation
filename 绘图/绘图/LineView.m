//
//  LineView.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LineView.h"

@implementation LineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置线段宽度
    CGContextSetLineWidth(ctx, 12);
    //线段头的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //3.设置线段颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    //2.移动到一个点
    CGContextMoveToPoint(ctx, 180, 40);
    //3.画一条线段
    CGContextAddLineToPoint(ctx, 190, 150);
    //4.渲染
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //画第二条线段
    CGContextMoveToPoint(ctx, 50, 100);
    
    CGContextAddLineToPoint(ctx, 100, 200);
    
    CGContextAddLineToPoint(ctx, 160, 100);
    CGContextAddLineToPoint(ctx, 50, 100);
    CGContextSetRGBStrokeColor(ctx, 0,0 , 1, 1);
    CGContextDrawPath(ctx, kCGPathStroke);

}



@end
