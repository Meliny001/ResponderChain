//
//  UIViewController+Event.m
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "UIViewController+Event.h"
#import "ZGEventProxy.h"
@implementation UIViewController (Event)

#pragma mark - ResponderEventDeal
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    // 结合Decorator模式,包装userInfo
    NSMutableDictionary * decoratorDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [decoratorDic setObject:@"MoreInfo" forKey:@"Decorator"];
    
    // 响应事件
    [[ZGEventProxy sharedEventProxy] handleEvent:eventName userInfo:decoratorDic withTarget:self];
    
    //[super routerEventWithName:eventName userInfo:userInfo]; // 如果需要继续往上传递则打开
}
@end
