//
//  LLTransation1VC.m
//  绘图
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LLTransation1VC.h"

@interface LLTransation1VC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSArray *images;

@end

@implementation LLTransation1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _images = @[
                [UIImage imageNamed:@"1.png"],
                [UIImage imageNamed:@"2.png"],
                [UIImage imageNamed:@"3.png"],
                [UIImage imageNamed:@"4.png"],
                [UIImage imageNamed:@"5.png"],
                [UIImage imageNamed:@"6.png"],
                ];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)changeImage:(id)sender {
    static int index = 1;
    //1,创建转场动画
    CATransition *transition = [CATransition animation];
    
    //2.设置转场动画的属性
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFade;
    //3.添加动画
    [_imageView.layer addAnimation:transition forKey:nil];
    
    UIImage *image = _images[index];
    _imageView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    index = (index + 1)% 6;
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
