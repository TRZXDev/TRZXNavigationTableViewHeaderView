//
//  ViewController.m
//  TRZXNavgitonTableViewHeaderView
//
//  Created by zhangbao on 2017/3/14.
//  Copyright © 2017年 TRZX. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "TRZXTableViewTestHeaderView.h"


@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) TRZXTableViewTestHeaderView *tableViewHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    _tableView.tableHeaderView = self.tableViewHeaderView;
    
    _tableViewHeaderView.coverImageUrl = @"http://kipo-att-img.img-cn-beijing.aliyuncs.com/201606/bdb1fa6a35d544c79a68147b7d8e14c1.jpg@!640x480";
    _tableViewHeaderView.title = @"测试标题";
}

#pragma mark - <UITableViewDelegate/DataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@" CELL -- %ld", indexPath.row];
    
    return cell;
}

#pragma mark - <Setter/Getter>
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        // 设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置背景色
        //        _tableView.backgroundColor = kTRZXBGrayColor;
        // 自动计算cell高度
        _tableView.estimatedRowHeight = 120.0f;
        // iOS8 系统中 rowHeight 的默认值已经设置成了 UITableViewAutomaticDimension
        _tableView.rowHeight = UITableViewAutomaticDimension;
        //        _tableView.estimatedSectionHeaderHeight = 10;
        //        _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
        // 去除cell分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (TRZXTableViewTestHeaderView *)tableViewHeaderView
{
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[TRZXTableViewTestHeaderView alloc] initWithScrollView:_tableView];
    }
    return _tableViewHeaderView;
}

@end
