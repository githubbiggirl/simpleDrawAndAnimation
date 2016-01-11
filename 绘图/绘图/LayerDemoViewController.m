//
//  LayerDemoViewController.m
//  绘图
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LayerDemoViewController.h"
#import "lilyLayer.h"

@interface LayerDemoViewController ()

@end

@implementation LayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建一个图层
    CALayer *layer = [CALayer layer];
    layer.cornerRadius = 100;
    //2.构建图层内容
    //2.1 方法一
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"jinmao.png"].CGImage);
    //3.设置几何属性
    layer.frame = CGRectMake(0, 0, 200, 200);
//    layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    layer.position = self.view.center;
    layer.zPosition = 1;
    layer.masksToBounds = YES;
    
    [self.view.layer addSublayer:layer];
    
    //2.2方法二
    lilyLayer *layer2 = [lilyLayer layer];
    layer2.bounds = CGRectMake(0, 0, 200, 150);
    layer2.position = CGPointMake(90, 140);
    layer2.anchorPoint = CGPointMake(0, 0);
    
    [layer2 setNeedsDisplay];
    
    [self.view.layer addSublayer:layer2];
    
    // Do any additional setup after loading the view from its nib.
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
