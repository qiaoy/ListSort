//
//  QYListSortViewController.h
//  ListSort
//
//  Created by 乔岩 on 2017/3/28.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QYListSortViewControllerDelegate;


@interface QYListSortViewController : UIViewController

@property (nonatomic, weak) id<QYListSortViewControllerDelegate> delegate;

- (instancetype)initListSortViewControllerWithTitleList:(NSArray<NSString *> *)titleList;

@end

@protocol QYListSortViewControllerDelegate <NSObject>

- (void)resetTitleListOrderWithList:(NSArray<NSString *> *)list;

@end
