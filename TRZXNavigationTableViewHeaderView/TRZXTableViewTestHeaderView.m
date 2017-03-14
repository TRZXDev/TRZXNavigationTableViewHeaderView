//
//  TRZXTableViewTestHeaderView.m
//  TRZXNavigationTableViewHeaderView
//
//  Created by zhangbao on 2017/3/14.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "TRZXTableViewTestHeaderView.h"

@implementation TRZXTableViewTestHeaderView

- (void)addOwnViews
{
    [super addOwnViews];
    
    UILabel *testLabel = [UILabel new];
    testLabel.text = @"自定义扩展视图";
    testLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:testLabel];
    
    testLabel.frame = CGRectMake(100, 100, 150, 100);
}

- (void)layoutFrameOfSubViews
{
    [super layoutFrameOfSubViews];
    
    
    
}

@end
