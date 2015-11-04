//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "TuijianViewModel.h"
#import "ScrollDisplayViewController.h"
#import "TuijianCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollDisplayViewControllerDelegate>

@property (nonatomic,strong)ScrollDisplayViewController *sdVC;
@property (nonatomic,strong)TuijianViewModel *tuijianVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController
-(TuijianViewModel *)tuijianVM
{
    if (!_tuijianVM) {
        _tuijianVM=[TuijianViewModel new];
    }
    return _tuijianVM;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tuijianVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuijianCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"forIndexPath:indexPath];
    cell.titleLb.text=[self.tuijianVM nameForRow:indexPath.row];
    NSString *Style=[self.tuijianVM styleForRow:indexPath.row ];
    NSString *Space=[self.tuijianVM spaceForRow:indexPath.row];
    cell.descLb.text=[NSString stringWithFormat:@"%@ | %@",Style,Space];
    cell.priceLb.text=[self.tuijianVM spaceForRow:indexPath.row];
    cell.buildLb.text=[self.tuijianVM priceIncludeForRow:indexPath.row];
    [cell.btnView addSubview:self.sdVC.view];
    
    
    
    return cell;
}
-(ScrollDisplayViewController *)sdVC
{
    NSMutableArray *arr=[NSMutableArray new];
    for (NSString *imgStr in self.tuijianVM.imageUrls) {
        [arr addObject:[NSURL URLWithString:imgStr]];
    }
    _sdVC=[[ScrollDisplayViewController alloc] initWithImgPaths:arr];
    _sdVC.delegate=self;
    //    vc.showPageControl=NO;
    //    vc.pageControlOffset=-30;
    
    [self addChildViewController:_sdVC];
    return _sdVC;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuijianVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tuijianVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
