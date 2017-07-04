//
//  LiaoViewController.m
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/7.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import "LiaoViewController.h"
#import "DetailViewController.h"

@interface LiaoViewController ()

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end

@implementation LiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"provinces_cities" ofType:@"plist"];
    
    _dictData = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    
    _listData = [_dictData objectForKey:@"辽宁省"];
    self.navigationItem.title = @"辽宁省信息";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource方法
//单元格数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_listData count];
}
//单元格实现
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置可重用标识符
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIentifier"];
    }
    
    //导入单元格标题
    NSInteger row = [indexPath row];
    NSDictionary *dict = [_listData objectAtIndex:row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    
    //设置单元格的辅助类型
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark -- UITableViewDelegate方法
//单元格点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger selectIndex = [indexPath row];
    NSDictionary *dict = [_listData objectAtIndex:selectIndex];
    
    //城市名称、网址数据导入
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    detailViewController.url = [dict objectForKey:@"url"];
    detailViewController.title = [dict objectForKey:@"name"];
    
    //跳转操作
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
