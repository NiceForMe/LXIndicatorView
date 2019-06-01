//
//  ViewController.m
//  LXIndicatorView
//
//  Created by mac on 2019/6/1.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "LXIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(50, 80, 100, 50)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    LXIndicatorView *redIndicatorView = [[LXIndicatorView alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(redView.frame) + 30, 300, 60) indicatorType:LXIndicatorViewTypeTop];
    redIndicatorView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:redIndicatorView];
    CGPoint redConvertPoint = [self.view convertPoint:redView.frame.origin toView:redIndicatorView];
    [redIndicatorView initIndicatorPathWithX:redConvertPoint.x + 50 cornerRadius:10.0];
    UILabel *redLabel = [[UILabel alloc]init];
    redLabel.text = @"这是一个箭头向上的引导图";
    CGFloat redLabelWidth = [redLabel.text boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : redLabel.font} context:nil].size.width;
    redLabel.frame = CGRectMake(15, 0, redLabelWidth, 60);
    [redIndicatorView addSubview:redLabel];
    redIndicatorView.frame = CGRectMake(redIndicatorView.frame.origin.x, redIndicatorView.frame.origin.y, redLabelWidth + 30, redIndicatorView.frame.size.height);
    //purper view
    UIView *purperView = [[UIView alloc]initWithFrame:CGRectMake(40, 400, 120, 50)];
    purperView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purperView];
    LXIndicatorView *purperIndicatorView = [[LXIndicatorView alloc]initWithFrame:CGRectMake(40, CGRectGetMinY(purperView.frame) - 80, 200, 50) indicatorType:LXIndicatorViewTypeBottom];
    purperIndicatorView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:purperIndicatorView];
    CGPoint purperConvertPoint = [self.view convertPoint:purperView.frame.origin toView:purperIndicatorView];
    [purperIndicatorView initIndicatorPathWithX:purperConvertPoint.x + 60 cornerRadius:10.0];
    UILabel *purperLabel = [[UILabel alloc]init];
    purperLabel.text = @"这是一个箭头向下的引导图";
    CGFloat purperLabelWidth = [purperLabel.text boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : purperLabel.font} context:nil].size.width;
    purperLabel.frame = CGRectMake(15, 0, purperLabelWidth, 50);
    [purperIndicatorView addSubview:purperLabel];
    purperIndicatorView.frame = CGRectMake(purperIndicatorView.frame.origin.x, purperIndicatorView.frame.origin.y, purperLabelWidth + 30, purperIndicatorView.frame.size.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
