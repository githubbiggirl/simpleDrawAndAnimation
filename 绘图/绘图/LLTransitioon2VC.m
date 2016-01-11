//
//  LLTransitioon2VC.m
//  绘图
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LLTransitioon2VC.h"

@interface LLTransitioon2VC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *type;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subtype;
@property (nonatomic, strong) CALayer *containerLayer;
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@end

@implementation LLTransitioon2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayers];
}
- (void)setupLayers
{
    _containerLayer = [CALayer layer];
    _containerLayer.bounds = CGRectMake(0, 0, 180, 180);
    _containerLayer.position = CGPointMake(180, 300);
    [self.view.layer addSublayer:_containerLayer];
    
    // redLayer
    _redLayer = [CALayer layer];
    _redLayer.backgroundColor = [UIColor redColor].CGColor;

    _redLayer.bounds = CGRectMake(0, 0, 180, 180);
    _redLayer.anchorPoint = CGPointZero;
    _redLayer.position = CGPointZero;
    _redLayer.hidden = NO;
    
    [_containerLayer addSublayer:_redLayer];
    
    
    // greenLayer
    _greenLayer = [CALayer layer];
    _greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    _greenLayer.bounds = _redLayer.bounds;
    _greenLayer.anchorPoint = CGPointZero;
    _greenLayer.position = CGPointZero;
    _greenLayer.hidden = YES;
    
    [_containerLayer addSublayer:_greenLayer];

    
}


- (IBAction)changeMode:(id)sender {
    
    CATransition *transition = [CATransition animation];
    
    NSArray *types = @[kCATransitionFade, kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal];
    
    NSArray *subType = @[kCATransitionFromRight, kCATransitionFromLeft, kCATransitionFromTop, kCATransitionFromBottom];
    
    transition.type = types[_type.selectedSegmentIndex];
    transition.subtype = subType[_subtype.selectedSegmentIndex];
    
    [_containerLayer addAnimation:transition forKey:nil];
    
    //触发的动作
    _redLayer.hidden = !_redLayer.hidden;
    _greenLayer.hidden = !_greenLayer.hidden;
    
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
