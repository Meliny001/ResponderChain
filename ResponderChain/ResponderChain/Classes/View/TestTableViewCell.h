//
//  TestTableViewCell.h
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

+ (__kindof TestTableViewCell *)cellWithTableView:(UITableView *)tableView;
+ (CGFloat)cellHeight;

@end
