//
//  ViewController.m
//  绘图
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *showArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr =@[@"LineViewController", @"shapeViewController", @"circleViewController", @"TextImageViewController", @"DrawBearViewController",@"LayerDemoViewController",@"LayerPropertiesVC",@"TanHuangViewController", @"CABasicAnimationVC",@"GroupAniamtianVC", @"LilyKeyFrameVC",@"LLTransation1VC",@"LLTransitioon2VC"];
    _showArr =@[@"drawLine",@"drawShape", @"drowCircle", @"textImageView", @"drawBear", @"lilyLayer",@"maskLayer",@"tanhuang",@"CABasic动画",@"CABasic组动画",@"关键帧动画superMario",@"Transition场景切换",@"各种方式切换几何"];
    
    
    UITableView *myTable =[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    [self.view addSubview:myTable];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MTCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = _showArr[indexPath.row];
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [NSClassFromString(_dataArr[indexPath.row])new];
    [self.navigationController pushViewController:controller animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
