//
//  LXIndicatorView.h
//  LXTestProject
//
//  Created by HSEDU on 2019/5/9.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LXIndicatorViewType){
    LXIndicatorViewTypeTop,
    LXIndicatorViewTypeBottom
};

@interface LXIndicatorView : UIView
@property (nonatomic,assign) LXIndicatorViewType type;
- (instancetype)initWithFrame:(CGRect)frame indicatorType:(LXIndicatorViewType)indicatorType;
- (void)initIndicatorPathWithX:(CGFloat)X cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
