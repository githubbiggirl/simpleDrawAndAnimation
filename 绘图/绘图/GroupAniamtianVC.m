//
//  GroupAniamtianVC.m
//  绘图
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "GroupAniamtianVC.h"

@interface GroupAniamtianVC ()
@property (nonatomic, strong) CALayer *layer;

@end

@implementation GroupAniamtianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayer];
    
    [self addAnimation4Layer:_layer];

}

- (void)setupLayer
{
    //创建图层
    _layer = [CALayer layer];
    
    //2.1外观
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.cornerRadius = 25;
    
    //2.2几何尺寸位置
    _layer.bounds = CGRectMake(0, 0, 200, 200);
    _layer.position = self.view.center;
    
    [self.view.layer addSublayer:_layer];

}

- (void)addAnimation4Layer:(CALayer *)layer
{
    //1.创建动画
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    
    //2.属性设置
     //2.1: Scale
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.toValue = @1.3;
    scaleAnim.duration = 2.0;
    
    //2.2  rotate
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnim.toValue = @M_PI_4;
    rotationAnim.duration = 1;
    rotationAnim.beginTime = 0.5;
    
    
    //2.3 color
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.fromValue = (__bridge id _Nullable)([UIColor yellowColor].CGColor);
    colorAnim.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    colorAnim.duration = 1.5;
    colorAnim.beginTime = 0.7;
    
    //2.4  group
    animaGroup.animations = @[scaleAnim,rotationAnim,colorAnim];
    animaGroup.duration = 2.0;
    animaGroup.autoreverses = YES;
    animaGroup.repeatCount = FLT_MAX;
    
    //3.添加到图层上
    [_layer addAnimation:animaGroup forKey:nil];

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
