//
//  DrawBearView.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "DrawBearView.h"

@interface DrawBearView ()
@property (nonatomic, assign) float flakeX;
@property (nonatomic, assign) float flakeY;

@end


@implementation DrawBearView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawBearHead
{
    //1获取上下文
    CGContextRef head=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(head, 5);

    //2.添加圆弧路径
    /*
     * ctx 图形上下文
     * CGFloat x, 中心坐标x轴
     * CGFloat y  中心坐标Y轴
     * radius   半径
     * CGFloat startAngle, 开始角度
     * CGFloat endAngle,   结束的角度
     * int clockwise     0：顺时针，1，逆时针
     */
    CGContextAddArc(head, 180, 200, 80, 0, 2*M_PI, 1);
    //3.绘制
    CGContextStrokePath(head);
}

- (void)drawBearEyes
{
    //1。获取上下文
    CGContextRef eyes=UIGraphicsGetCurrentContext();

    
    //画椭圆的方法
    CGContextAddEllipseInRect(eyes, CGRectMake(135, 170, 25, 14));
    CGContextAddEllipseInRect(eyes, CGRectMake(200, 170, 25, 14));
    CGContextSetFillColorWithColor(eyes, [UIColor whiteColor].CGColor);
    
        //填充
    CGContextFillPath(eyes);
}
- (void)DrawBearEye{
    //1。获取上下文
    CGContextRef eye=UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(eye, CGRectMake(142, 171, 11, 13));
    CGContextAddEllipseInRect(eye, CGRectMake(207, 171, 11, 13));
    CGContextSetFillColorWithColor(eye, [UIColor blackColor].CGColor);
    
    CGContextFillPath(eye);
}

- (void)drawBearNose
{
    //1。获取上下文
    CGContextRef nose=UIGraphicsGetCurrentContext();
    
    //设置线段相关属性 线段宽度 10
    CGContextSetLineWidth(nose, 5);
    
    //设置拐角样式
    CGContextSetLineJoin(nose, kCGLineJoinRound);
    //画第二条线段
    CGContextSetRGBStrokeColor(nose, 1, 1, 0, 1);
    
    CGContextMoveToPoint(nose,180, 200);
    
    CGContextAddLineToPoint(nose, 170, 210);
    
    CGContextAddLineToPoint(nose, 173, 223);
    
    //再次进行渲染
    CGContextStrokePath(nose);
}
- (void)drawMouth
{
    //1.获取上下文
    CGContextRef mouth=UIGraphicsGetCurrentContext();
    //2.绘制圆弧
    CGContextAddArc(mouth, 180, 200, 50, M_PI_4, M_PI_4*3, 0);
    
    CGContextSetRGBStrokeColor(mouth, 1, 0, 0, 1);

    //3.绘制
    CGContextStrokePath(mouth);
}
- (void)drawBody
{
    //1。获取上下文
    CGContextRef body=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(body, 0, 0, 0, 1);

    //画椭圆的方法
    CGContextAddEllipseInRect(body, CGRectMake(40, 280, 280, 250));
    CGContextSetFillColorWithColor(body, [UIColor brownColor].CGColor);
    //填充
    CGContextStrokePath(body);
    
    //创建渐变效果
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    //渐变的颜色值RGB
    const CGFloat components[] = {
       .3,.3,.3,.3,
       .7,.7,.7,.7,
        1,1,1,1
    };
    //location
    const CGFloat locations[] = {0,.3,1.0};}
    //创建渐变对象

- (void)drawCodes
{
    //1画个圆角矩形
    CGRect rect = CGRectMake(170, 300, 20, 20);
    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5];
    //2设置填充色
    [[UIColor greenColor] setFill];
    
    //3绘制 即描边又填充 stroke,fill;
    [path fill];
    //1画个圆角矩形
    CGRect rect1 = CGRectMake(170, 360, 20, 20);
    UIBezierPath *path1=[UIBezierPath bezierPathWithRoundedRect:rect1 cornerRadius:5];
    //2设置填充色
    [[UIColor greenColor] setFill];
    
    //3绘制 即描边又填充 stroke,fill;
    [path1 fill];
    //1画个圆角矩形
    CGRect rect2 = CGRectMake(170, 420, 20, 20);
    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:5];
    //2设置填充色
    [[UIColor greenColor] setFill];
    
    //3绘制 即描边又填充 stroke,fill;
    [path2 fill];
}
- (void)drawHat
{
    //1。获取上下文
    CGContextRef hat=UIGraphicsGetCurrentContext();
    //画第二条线段
    CGContextMoveToPoint(hat, 140, 130);
    
    CGContextAddLineToPoint(hat, 280, 80);
    CGContextAddLineToPoint(hat, 260, 170);
    CGContextSetRGBStrokeColor(hat, 0, 0, 1, 1);
    CGContextDrawPath(hat, kCGPathStroke);
    
}
- (void)drawLegs
{
    //1.获取上下文
    CGContextRef legs=UIGraphicsGetCurrentContext();
    
//    //添加绘画路径矩形路径
//    CGContextAddRect(legs, CGRectMake(110,510, 50, 100));
    //.2上下文移动到移动一个开始位置
    CGContextMoveToPoint(legs, 180, 530);
    //2.1添加一条线段
    CGContextAddLineToPoint(legs, 50, 620);
    //3.3添加一条线段
    CGContextAddLineToPoint(legs, 310, 620);
    
    //关闭路径 (最后一个点和起始点连接)
    CGContextClosePath(legs);

    //设置描边
    //CGContextSetStrokeColorWithColor(ctx,[UIColor blueColor].CGColor);
    [[UIColor blackColor] setStroke];
    
    //设置填充色
    // CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    [[UIColor colorWithRed:0.1 green:0.5 blue:0.3 alpha:0.2] setFill];
    
    //渲染
    CGContextDrawPath(legs, kCGPathFillStroke);

}

- (void)drawArms
{
        //绘制贝塞尔曲线
        UIBezierPath *bPath = [UIBezierPath bezierPath];
        //设置线段相关属性 线段宽度 5
        [bPath setLineWidth:10];
  
        //移动到一个开始点
        [bPath  moveToPoint:CGPointMake(250, 400)];
        //添加贝塞尔曲线
        [bPath addCurveToPoint:CGPointMake(280, 480) controlPoint1:CGPointMake(400, 500) controlPoint2:CGPointMake(300, 480)];
        //设置描边
        [[UIColor whiteColor]setStroke];
    
        //绘制出来
        [bPath stroke];

}

//- (void)snowFly
//{
//    UIImage *snowimage = [UIImage imageNamed:@"flake"];
//    
//    UIImageView *snow = [[UIImageView alloc] initWithImage:snowimage];
//    [self addSubview:snow];
//    
//    int ScreenW = [UIScreen mainScreen].bounds.size.width;
//    
//    int location1 = round(random()%ScreenW);
//    
//    double scale = 1/random()%100 +1.0;
//    
//    double speed = 1/random()%100 +1.0;
//    
//    snow.frame = CGRectMake(location1, -60, 10*scale, 10*scale);
//    
//    [UIView animateWithDuration:10*speed animations:^{
//        int location2 = round(random()%ScreenW);
//        snow.frame = CGRectMake(location2, 600, 30*scale, 30*scale);
//    }
//                     completion:^(BOOL finished) {
//                         [snow removeFromSuperview];
//                     }];
//
//}
//


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawBearHead];
    [self drawBearEyes];
    [self DrawBearEye];
    [self drawBearNose];
    [self drawMouth];
    [self drawBody];
    [self drawCodes];
    [self drawHat];
    [self drawLegs];
    [self drawArms];
//    [self snowFly];
    
    
    
}


@end
