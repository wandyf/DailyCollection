//
//  MainViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "MainViewController.h"

#import <Masonry.h>
#import "MainViewModel.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MainViewModel *viewModel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DailyCollection";
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(self.view.safeAreaInsets);
    }];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.vcArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *infoDict = self.viewModel.vcArray[indexPath.row];
    NSString *name = infoDict[@"name"];
    NSString *desc = infoDict[@"desc"];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = desc;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *infoDict = self.viewModel.vcArray[indexPath.row];
    NSString *name = infoDict[@"name"];
    id controller = [[NSClassFromString(name) alloc] init];
    [controller setValue:name forKey:@"title"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Get

- (MainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [MainViewModel.alloc init];
    }
    return _viewModel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _tableView;
}

@end
