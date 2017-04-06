//
//  QYTitleListTableViewCell.m
//  ListSort
//
//  Created by 乔岩 on 2017/4/6.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "QYTitleListTableViewCell.h"

@interface QYTitleListTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

static CGFloat kPadding = 12.f;

@implementation QYTitleListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding));
    }];
}

- (void)configTitleListTableViewCellWithTitle:(NSString *)title {
    self.titleLabel.text = title;
}

#pragma mark - Getters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    return _titleLabel;
}

@end
