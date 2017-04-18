//
//  ViewController.m
//  TableViewHeightCount
//
//  Created by mac on 2017/4/18.
//  Copyright © 2017年 mac. All rights reserved.


#import "ViewController.h"
#import "HYBTestCell.h"
#import "HYBTestModel.h"
#import "HYBCommentModel.h"
#import <UITableViewCell+HYBMasonryAutoCellHeight.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, HYBTestCellDelegate>

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    for (NSUInteger i = 0; i < 100; ++i) {
        HYBTestModel *testModel = [[HYBTestModel alloc] init];
        testModel.title = @"PramaWells";
        testModel.desc = @"cell中嵌套使用tableview并自动计算行高。通过HYBMasonryAutoCellHeight自动计算行高";
        testModel.headImage = @"head";
        testModel.uid = [NSString stringWithFormat:@"testModel%ld", i + 1];
        NSUInteger randCount = arc4random() % 10 + 1;
        for (NSUInteger j = 0; j < randCount; ++j) {
            HYBCommentModel *model = [[HYBCommentModel alloc] init];
            model.name = @"ty";
            model.reply = @"PramaWells";
            model.comment = @"6666666";
            model.cid = [NSString stringWithFormat:@"commonModel%ld", j + 1];
            [testModel.commentModels addObject:model];
        }
        
        [self.datasource addObject:testModel];
    }
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
}

- (NSMutableArray *)datasource {
    if (_datasource == nil) {
        _datasource = [[NSMutableArray alloc] init];
    }
    
    return _datasource;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYBTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[HYBTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.delegate = self;
    }
    
    HYBTestModel *model = [self.datasource objectAtIndex:indexPath.row];
    [cell configCellWithModel:model indexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYBTestModel *model = [self.datasource objectAtIndex:indexPath.row];
    
    CGFloat h = [HYBTestCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        HYBTestCell *cell = (HYBTestCell *)sourceCell;
        [cell configCellWithModel:model indexPath:indexPath];
    } cache:^NSDictionary *{
        NSDictionary *cache = @{kHYBCacheUniqueKey : model.uid,
                                kHYBCacheStateKey  : @"",
                                kHYBRecalculateForStateKey : @(model.shouldUpdateCache)};
        model.shouldUpdateCache = NO;
        return cache;
    }];
    
    return h;
}

#pragma mark - HYBTestCellDelegate
- (void)reloadCellHeightForModel:(HYBTestModel *)model atIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end

