//
//  HYBTestModel.m
//  TableViewHeightCount
//
//  Created by mac on 2017/4/18.
//  Copyright © 2017年 mac. All rights reserved.
//



#import "HYBTestModel.h"

@implementation HYBTestModel

- (NSMutableArray *)commentModels {
    if (_commentModels == nil) {
        _commentModels = [[NSMutableArray alloc] init];
    }
    
    return _commentModels;
}

@end

