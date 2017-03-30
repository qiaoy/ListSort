//
//  QYFileManager.h
//  ListSort
//
//  Created by 乔岩 on 2017/3/30.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFileManager : NSObject

/**
 保存titleList
 
 @param list 排序后的list顺序
 */
+ (void)saveTitleListWithNewList:(NSArray *)list;

/**
 获取当前语种的title list 顺序
 
 @return title list
 */
+ (__kindof NSArray *)currentTitleList;

/**
 默认排序
 */
+ (__kindof NSArray *)defaultTitleList;

@end
