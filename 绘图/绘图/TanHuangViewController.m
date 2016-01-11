//
//  TanHuangViewController.m
//  绘图
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TanHuangViewController.h"

@interface TanHuangViewController ()
@property (nonatomic, assign) BOOL isSHOW;
@property (nonatomic, strong) NSMutableArray *btnArrays;
@end

@implementation TanHuangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBtns];
    
    
}

- (void)createBtns
{
    CGFloat btnW = 71.f;
    CGFloat btnH = 71.f;
    
    CGFloat marginX = (CGRectGetWidth(self.view.frame) - 3 * btnW)/ 4.0;
    CGFloat marginY = 35;
    
    NSArray *imageNames = @[@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review"];
    
    _btnArrays = [NSMutableArray array];
    for (int i = 0; i < imageNames.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //属性设置
        int column = i % 3;
        int row = i / 3;
        CGFloat btnX = marginX + column * (btnW + marginX);
        CGFloat btnY = marginY + CGRectGetHeight(self.view.frame) + row * (btnH + marginY);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onBtnArraysClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        //将btn添加到数组中
        [_btnArrays addObject:btn];
    }
}
- (IBAction)startAnimations:(id)sender {
    if (_isSHOW) {
        [self hideBtnsWithAnimations:YES];
//        _isSHOW = NO;
    }else{
        [self showBtnsWithAnimations:YES];
//        _isSHOW = YES;
    }
}

- (void)hideBtnsWithAnimations:(BOOL)animate
{
    if (animate) {
        for (int i = 0; i < _btnArrays.count; i++) {
            [UIView animateWithDuration:0.6 delay:i*0.02 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
                //动画要执行的方法
                UIButton *btn = _btnArrays[_btnArrays.count-i-1];
                NSLog(@">>>%@",[btn.layer actionForKey:@"position"]);
                CGPoint center = btn.center;
                center.y += 500;
                btn.center = center;
            } completion:nil];
        }
        //动画结束后需要调用的方法
    }else{
        for (int i = 0; i < _btnArrays.count; i ++) {
            UIButton *btn = _btnArrays[i];
            NSLog(@">>>%@",[btn.layer actionForKey:@"position"]);
            CGPoint center = btn.center;
            center.y += 500;
            btn.center = center;
        }
    }
    _isSHOW = NO;

}
- (void)showBtnsWithAnimations:(BOOL)animate
{
    if (animate) {
        for (int i = 0; i < _btnArrays.count; i++) {
            [UIView animateWithDuration:0.6 delay:i*0.02 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
                //动画要执行的方法
                UIButton *btn = _btnArrays[i];
                NSLog(@">>>%@",[btn.layer actionForKey:@"position"]);
                CGPoint center = btn.center;
                center.y -= 500;
                btn.center = center;
            } completion:nil];
        }
        //动画结束后需要调用的方法
    }else{
        for (int i = 0; i < _btnArrays.count; i ++) {
            UIButton *btn = _btnArrays[i];
            NSLog(@">>>%@",[btn.layer actionForKey:@"position"]);
            CGPoint center = btn.center;
            center.y -= 500;
            btn.center = center;
        }
    }
        _isSHOW = YES;
}

//点击某个按钮放大效果
- (void)onBtnArraysClicked:(UIButton *)btn{
    [UIView animateWithDuration:0.4 animations:^{
        btn.transform = CGAffineTransformScale(btn.transform, 1.7, 1.7);
        btn.alpha = 0.4;
    }completion:^(BOOL finished) {
        btn.transform = CGAffineTransformIdentity;
        btn.alpha = 1;
        [self hideBtnsWithAnimations:YES];
    }];
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
