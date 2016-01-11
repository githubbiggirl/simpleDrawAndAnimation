//
//  lilyLayer.m
//  LayerDemo
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 lily. All rights reserved.
//

#import "lilyLayer.h"

@implementation lilyLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 200, 100));
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextFillPath(ctx);
}

@end
