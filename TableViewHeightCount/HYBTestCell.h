//
//  HYBTestCell.h
//  TableViewHeightCount
//
//  Created by mac on 2017/4/18.
//  Copyright © 2017年 mac. All rights reserved.
//



#import <UIKit/UIKit.h>

@class HYBTestModel;

@protocol HYBTestCellDelegate <NSObject>

- (void)reloadCellHeightForModel:(HYBTestModel *)model atIndexPath:(NSIndexPath *)indexPath;

@end

@interface HYBTestCell : UITableViewCell

@property (nonatomic, weak) id delegate;

- (void)configCellWithModel:(HYBTestModel *)model indexPath:(NSIndexPath *)indexPath;

@end

