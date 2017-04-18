//
//  HYBTestModel.h
//  TableViewHeightCount
//
//  Created by mac on 2017/4/18.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HYBTestModel : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *headImage;

// 评论数据源
@property (nonatomic, strong) NSMutableArray *commentModels;

// 因为评论是动态的，因此要标识是否要更新缓存
@property (nonatomic, assign) BOOL shouldUpdateCache;

@end

