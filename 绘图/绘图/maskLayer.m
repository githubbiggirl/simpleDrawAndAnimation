//
//  maskLayer.m
//  绘图
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "maskLayer.h"

@implementation maskLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, 100);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextSetRGBFillColor(ctx, 0, 1, 1, 1);
    
    CGContextFillPath(ctx);
}
@end
