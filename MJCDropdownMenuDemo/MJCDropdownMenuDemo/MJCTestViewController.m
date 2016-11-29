//
//  MJCTestViewController.m
//  MJCDropdownMenuDemo
//
//  Created by mjc on 16/11/29.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTestViewController.h"

@interface MJCTestViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation MJCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testTableView.delegate = self;
    self.testTableView.dataSource = self;
    
    
}


#pragma mark - UITableviewdatasource
//多少组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}
//每行表格什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义个重用标识符
    static NSString *ID = @"cell";
    
    // 2.先从缓存池去找可重用的cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.进行判断:缓存池没有可重用的cell,创建一个新的cell,并绑定一个重用标识
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"扫一扫";
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

//在TableView上选中某个Cell会触发点击方法,被选中时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}





@end
