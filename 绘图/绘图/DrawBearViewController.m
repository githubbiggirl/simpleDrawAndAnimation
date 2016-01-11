//
//  DrawBearViewController.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "DrawBearViewController.h"
#import "DrawBearView.h"

@interface DrawBearViewController ()
@property (weak, nonatomic) IBOutlet DrawBearView *bearView;


@end

@implementation DrawBearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:_bearView selector:@selector(setNeedsDisplay)];
//    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(snowFly) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view from its nib.
}
- (void)snowFly
{
    UIImage *snowimage = [UIImage imageNamed:@"flake"];
    
    UIImageView *snow = [[UIImageView alloc] initWithImage:snowimage];
    [self.view addSubview:snow];
    
    int ScreenW = [UIScreen mainScreen].bounds.size.width;
    
    int location1 = round(random()%ScreenW);
    
    double scale = 0.5;

    double speed = 1.0;///random()%100 +1.0;
    
    snow.frame = CGRectMake(location1, -60, 10*scale, 10*scale);
    
    [UIView animateWithDuration:10*speed animations:^{
        int location2 = round(random()%ScreenW);
        snow.frame = CGRectMake(location2, 600, 30*scale, 30*scale);
    }
                     completion:^(BOOL finished) {
                         [snow removeFromSuperview];
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
