//
//  QYTitleListViewModel.h
//  ListSort
//
//  Created by 乔岩 on 2017/3/31.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYTitleListViewModel : NSObject

@property (nonatomic, readonly, copy) NSArray *list;

- (void)resetListWith:(NSArray<NSString *> *)list;

@end
