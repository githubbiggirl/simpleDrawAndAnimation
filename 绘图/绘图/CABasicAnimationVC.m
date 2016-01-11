//
//  CABasicAnimationVC.m
//  绘图
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CABasicAnimationVC.h"

@interface CABasicAnimationVC ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation CABasicAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
     //创建图层
    _layer = [CALayer layer];
    
    //2.1外观
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.cornerRadius = 25;
    
    //2.2几何尺寸位置
    _layer.bounds = CGRectMake(0, 0, 200, 200);
    _layer.position = self.view.center;
    
    //3.添加
    [self.view.layer addSublayer:_layer];
    
    //4.为图层添加动画
    [self addAnimatian4Layer:_layer];

}

- (void)addAnimatian4Layer:(CALayer *)layer
{
    //1.创建动画对象
    CABasicAnimation *scaleAnama = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//虚拟属性
    //2.设置动画对象的属性
    scaleAnama.duration = 0.3;
    scaleAnama.toValue = @1.5;
    scaleAnama.autoreverses = YES;
    scaleAnama.repeatCount = FLT_MAX;//相当于最大值 ，无限重复
    
    [layer addAnimation:scaleAnama forKey:nil];
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
