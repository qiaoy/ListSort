//
//  QYMainViewController.m
//  ListSort
//
//  Created by 乔岩 on 2017/3/28.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "QYMainViewController.h"
#import "QYTitleListViewModel.h"

@interface QYMainViewController () <UITableViewDataSource>

@property (nonatomic, strong) QYTitleListViewModel *listViewModel;

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *const kTitleListCell = @"kTitleListCell";

@implementation QYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    self.listViewModel = [[QYTitleListViewModel alloc] init];
    [self setUpUI];
}

#pragma mark - SetUp

- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listViewModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTitleListCell forIndexPath:indexPath];
    cell.textLabel.text = self.listViewModel.list[indexPath.row];
    return cell;
}

#pragma mark - Getters

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTitleListCell];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
