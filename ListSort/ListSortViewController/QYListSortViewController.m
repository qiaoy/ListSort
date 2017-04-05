//
//  QYListSortViewController.m
//  ListSort
//
//  Created by 乔岩 on 2017/3/28.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import "QYListSortViewController.h"

@interface QYListSortViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *const kTitleListCell = @"kTitleListCell";

@implementation QYListSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    [self setUpUI];
}

#pragma mark - SetUI

- (void)setUpUI {
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableView Delegate


#pragma mark - Getters

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTitleListCell];
    }
    return _tableView;
}

@end
