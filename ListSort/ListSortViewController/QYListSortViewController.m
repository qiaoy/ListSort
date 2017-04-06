//
//  QYListSortViewController.m
//  ListSort
//
//  Created by 乔岩 on 2017/3/28.
//  Copyright © 2017年 qiaoyan. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "QYListSortViewController.h"

@interface QYListSortViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray<NSString *> *titleList;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *footerBtn;
@property (nonatomic, strong) UIButton *rightButton;

@end

static NSString *const kTitleListCell = @"kTitleListCell";
static NSString *const kFooterBtnTitle = @"恢复默认排序";

static CGFloat const kFooterBtnH = 60;

@implementation QYListSortViewController

#pragma mark - Life Circle

- (instancetype)initListSortViewControllerWithTitleList:(NSArray<NSString *> *)titleList {
    if (self = [super init]) {
        self.titleList = titleList;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.title = NSStringFromClass([self class]);
    [self setUpUI];
}

#pragma mark - SetUI

- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIBarButtonItem *rigthItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = rigthItem;
}

#pragma mark - Events

- (void)footerBtnClick:(UIButton *)button {
    
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTitleListCell forIndexPath:indexPath];
    cell.textLabel.text = self.titleList[indexPath.row];
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

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        [_rightButton setTitle:@"完成" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _rightButton;
}

@end
