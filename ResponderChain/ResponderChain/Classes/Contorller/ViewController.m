//
//  ViewController.m
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//  UIResponder解决事件传递  ☞☞☞传送门<https://casatwy.com/responder_chain_communication.html>

#import "ViewController.h"
#import "ZGViewManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) ZGViewManager *viewManager;
@property (nonatomic,strong) NSDictionary <NSString *,NSInvocation*>* eventStrategy;

@end

@implementation ViewController
- (ZGViewManager *)viewManager
{
    if (!_viewManager) {
        _viewManager = [[ZGViewManager alloc] init];
    }return _viewManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self.viewManager;
    self.tableView.dataSource = self.viewManager;
}
- (void)add:(NSDictionary *)userInfo
{
    ZGLog(@"%@",userInfo);
}
- (void)textFieldValueChange:(NSDictionary *)userInfo
{
    ZGLog(@"%@",userInfo);
}
@end
