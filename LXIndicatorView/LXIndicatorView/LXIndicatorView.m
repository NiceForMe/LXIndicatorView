//
//  LXIndicatorView.m
//  LXTestProject
//
//  Created by HSEDU on 2019/5/9.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "LXIndicatorView.h"

@interface LXIndicatorView ()
@property (nonatomic,strong) CAShapeLayer *pathLayer;
@property (nonatomic,assign) CGFloat indicatorX;
@property (nonatomic,strong) UIBezierPath *path;
@property (nonatomic,strong) CAShapeLayer *cornerLayer;
@end

@implementation LXIndicatorView
- (instancetype)initWithFrame:(CGRect)frame indicatorType:(LXIndicatorViewType)indicatorType;
{
    if (self = [super initWithFrame:frame]) {
        self.type = indicatorType;
        CAShapeLayer *cornerLayer = [CAShapeLayer layer];
        self.cornerLayer = cornerLayer;
        [self.layer addSublayer:cornerLayer];
        [self initIndicatorView];
    }
    return self;
}

- (void)initIndicatorView
{
    
}

- (void)initIndicatorPathWithX:(CGFloat)X cornerRadius:(CGFloat)cornerRadius
{
    if (self.pathLayer) {
        [self.pathLayer removeFromSuperlayer];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat trueX = X;
        CGFloat pathWidth = 20;
        //使用bezierPath曲线绘制三角形
        UIBezierPath *path = [UIBezierPath bezierPath];
        self.path = path;
        //根据type的不同三个点的位置不同
        CGPoint firstPoint = self.type == LXIndicatorViewTypeTop ? CGPointMake(trueX - pathWidth / 2, 0) : CGPointMake(trueX - pathWidth / 2 ,self.frame.size.height);
        CGPoint secondPoint = self.type == LXIndicatorViewTypeTop ? CGPointMake(trueX, -15) : CGPointMake(trueX, self.frame.size.height + 15);
        CGPoint thirdPoint = self.type == LXIndicatorViewTypeTop ? CGPointMake(trueX + pathWidth / 2, 0) : CGPointMake(trueX + pathWidth / 2, self.frame.size.height);
        [path moveToPoint:firstPoint];
        [path addLineToPoint:secondPoint];
        [path addLineToPoint:thirdPoint];
        //CAShapeLayer配合bezierpath曲线绘制三角形
        CAShapeLayer *layer = [CAShapeLayer layer];
        self.pathLayer = layer;
        layer.strokeColor = [UIColor lightGrayColor].CGColor;
        layer.fillColor = [UIColor lightGrayColor].CGColor;
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
        //圆角，给父视图添加圆角一定要通过bezierPath曲线，如果设置layer.cornerRadius会导致上面的三角形无法绘制
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        self.cornerLayer.path = cornerPath.CGPath;
        self.cornerLayer.fillColor = [UIColor lightGrayColor].CGColor;
    });
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
    [self.path fill];
}

@end
