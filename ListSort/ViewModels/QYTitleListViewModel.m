//
//  QYTitleListViewModel.m
//  ListSort
//
//  Created by 乔岩 on 2017/3/31.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import "QYTitleListViewModel.h"
#import "QYFileManager.h"

@interface QYTitleListViewModel ()

@property (nonatomic, copy) NSArray *list;

@end

@implementation QYTitleListViewModel

- (instancetype)init {
    if (self = [super init]) {
        self.list = [QYFileManager currentTitleList];
    }
    return self;
}

- (void)resetListWith:(NSArray<NSString *> *)list {
    self.list = list;
}

@end
