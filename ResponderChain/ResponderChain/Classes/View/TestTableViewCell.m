//
//  TestTableViewCell.m
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell()

@property (weak, nonatomic) IBOutlet UITextField *textF;


@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChange) name:UITextFieldTextDidChangeNotification object:self.textF];
}

+ (__kindof TestTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:nil options:nil].firstObject;
    }return cell;
    
}
+ (CGFloat)cellHeight
{
    return 50.0f;
}

- (IBAction)add:(id)sender
{
    // 发送事件
    [self routerEventWithName:NSStringFromSelector(_cmd) userInfo:@{NSStringFromSelector(_cmd):@"tea"}];
}

- (void)textFieldValueChange
{
    // 发送事件
    [self routerEventWithName:NSStringFromSelector(_cmd) userInfo:@{NSStringFromSelector(_cmd):self.textF.text.length>0?self.textF.text:@""}];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
