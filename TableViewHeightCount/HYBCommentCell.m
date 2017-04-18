//
//  HYBCommentCell.m
//  TableViewHeightCount
//
//  Created by mac on 2017/4/18.
//  Copyright © 2017年 mac. All rights reserved.
//


#import "HYBCommentCell.h"
#import "HYBCommentModel.h"
#import <UITableViewCell+HYBMasonryAutoCellHeight.h>
#import <Masonry.h>
#import "HYBCommentModel.h"

@interface HYBCommentCell ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation HYBCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // title
        self.contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.contentLabel];
        self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 110;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:12];
        __weak __typeof(self) weakSelf = self;
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(weakSelf.contentView);
        }];
        
        self.hyb_lastViewInCell = self.contentLabel;
    }
    
    return self;
}

- (void)configCellWithModel:(HYBCommentModel *)model {
    NSString *str = [NSString stringWithFormat:@"%@回复%@：%@",
                     model.name, model.reply, model.comment];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(0, model.name.length)];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(model.name.length + 2, model.reply.length)];
    self.contentLabel.attributedText = text;
}

@end

