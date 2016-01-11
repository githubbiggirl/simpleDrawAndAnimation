//
//  LilyKeyFrameVC.m
//  绘图
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LilyKeyFrameVC.h"

@interface LilyKeyFrameVC ()
@property (nonatomic, strong) CALayer *platformLayer;
@property (nonatomic, strong) CALayer *marioLayer;
@end

@implementation LilyKeyFrameVC
#define halfScrW   CGRectGetWidth(self.view.frame)/2.0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. setup layers
    [self setupLayers];

}

- (void)setupLayers
{
    //1.platform Layer
    _platformLayer = [CALayer layer];
    //外观
    _platformLayer.backgroundColor = [UIColor brownColor].CGColor;
    _platformLayer.cornerRadius = 13;
    
    //几何
    _platformLayer.bounds = CGRectMake(0, 0, halfScrW + 20, 44);
    
    _platformLayer.anchorPoint = CGPointZero;
    _platformLayer.position = CGPointMake(halfScrW, 200);
    
    
    [self.view.layer addSublayer:_platformLayer];
    
    //2. Mario Layer
    _marioLayer = [CALayer layer];
    
    _marioLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Mario"].CGImage);
    
    //内容区域
    _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    _marioLayer.bounds = CGRectMake(0, 0, 32, 64);
    _marioLayer.anchorPoint = CGPointMake(0, 1);
    _marioLayer.position = CGPointMake(0, self.view.frame.size.height);
    
    [self.view.layer addSublayer:_marioLayer];
}
- (IBAction)jump:(id)sender {
    
    //1.创建关键帧动画对象
    CAKeyframeAnimation *jumpAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.属性设置
    
    [CATransaction setCompletionBlock:^{
        //把隐式动画的效果关掉
        [CATransaction setDisableActions:YES];
        //动画结束后的回调，将玛丽放到动画结束的地方
        _marioLayer.position = CGPointMake(halfScrW+10, 200);
        //显示图片的右半部分
        _marioLayer.contentsRect = CGRectMake(0, 0, 0.5, 1);
        }];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    
    
    jumpAnim.duration = 1.0;
    CGMutablePathRef path = CGPathCreateMutable();
    //移动画笔到起点
    CGPathMoveToPoint(path, NULL, 0, self.view.frame.size.height);CGPathAddCurveToPoint(path, NULL, 30, 140, halfScrW+10, 140, halfScrW+10, 200);
    jumpAnim.path = path;
    
    [_marioLayer addAnimation:jumpAnim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
