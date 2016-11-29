//
//  MJCTestViewController2.m
//  MJCDropdownMenuDemo
//
//  Created by mjc on 16/11/29.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTestViewController2.h"

@interface MJCTestViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end

@implementation MJCTestViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    self.rightTableView.rowHeight = 80;
    self.rightTableView.contentInset = UIEdgeInsetsMake(-20, 0, -20, 0);
    self.rightTableView.sectionHeaderHeight = 0;
    self.rightTableView.sectionFooterHeight = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.rightTableView.backgroundColor = [UIColor clearColor];
    self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableviewdatasource
//多少组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"啦啦啦啦";
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
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"扫一扫";
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];

    }else if (indexPath.section == 1){
        cell.textLabel.text = @"二维码";
        cell.backgroundColor = [UIColor clearColor];

    }else{
        cell.textLabel.text = @"啦啦啦";
        cell.backgroundColor = [UIColor clearColor];

    }
    
    
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

//在TableView上选中某个Cell会触发点击方法,被选中时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
