//
//  circleView.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "circleView.h"

@implementation circleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
     //1.连接上下文
    CGContextRef circle = UIGraphicsGetCurrentContext();
    //2.添加圆弧路径
    CGContextAddArc(circle, 100, 150, 50, 0,M_PI_2, 0);
    //3.绘制
    CGContextStrokePath(circle);

//    CGContextAddArc(circle, 100, 100, 50, M_PI, M_PI_2, 1);
    //绘制
//    CGContextStrokePath(circle);
}



@end
