//
//  UIImage+draw.m
//  绘图
//
//  Created by qingyun on 16/1/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "UIImage+draw.h"

@implementation UIImage (draw)

- (UIImage *)waterImageWithLogo:(NSString *)image
{
    /**
     *  如果想要创建UIImage，一定要开启位图上下文
     */
    // 1. 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    //2.画母版图片（背景）
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    //3.画水印
    UIImage *logoImg = [UIImage imageNamed:image];
    
    CGFloat logX,logY,logW,logH;
    CGFloat scale = .2;
    CGFloat space = 10;
    
    logX = self.size.width - logW - space;
    logY = self.size.height - logH - space;
    logW = logoImg.size.width * scale;
    logH = logoImg.size.height * scale;
    
    [logoImg drawInRect:CGRectMake(logX, logY, logW, logH)];
    
    //4.从上下文中取出加完水印的图片
    UIImage *waterImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭位图上下文
    UIGraphicsEndImageContext();
    return waterImg;
}

@end
