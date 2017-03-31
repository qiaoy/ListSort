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
#import "QYListSortViewController.h"
#import "QYMainNavigationController.h"

@interface QYMainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) QYTitleListViewModel *listViewModel;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *footerBtn;

@end

static NSString *const kTitleListCell = @"kTitleListCell";
static NSString *const kFooterBtnTitle = @"调整列表顺序";

static CGFloat const kFooterBtnH = 60;

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

#pragma mark - Events

- (void)footerBtnClick:(UIButton *)button {
    QYListSortViewController *listSortVC = [[QYListSortViewController alloc] init];
    QYMainNavigationController *nav = [[QYMainNavigationController alloc] initWithRootViewController:listSortVC];
    [self presentViewController:nav animated:YES completion:nil];
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

#pragma mark - UITableView Delegate

- (__kindof UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.footerBtn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kFooterBtnH;
}

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

- (UIButton *)footerBtn {
    if (!_footerBtn) {
        _footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _footerBtn.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kFooterBtnH);
        [_footerBtn setTitle:kFooterBtnTitle forState:UIControlStateNormal];
        [_footerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_footerBtn addTarget:self action:@selector(footerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
