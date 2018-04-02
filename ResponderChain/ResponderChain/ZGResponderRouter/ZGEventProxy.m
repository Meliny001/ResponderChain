//
//  ZGEventProxy.m
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "ZGEventProxy.h"

@interface ZGEventProxy()

@property (nonatomic,strong) NSDictionary <NSString *,NSInvocation*>* eventStrategy;/**<key:RootEventSelName Value:VC-ActionSelName*/
@property (nonatomic,weak) UIViewController *delegate;

@end

@implementation ZGEventProxy
+ (__kindof ZGEventProxy *)sharedEventProxy
{
    static ZGEventProxy * proxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        proxy = [ZGEventProxy alloc];
    });
    return proxy;
}
// Strategy模式事件分发
- (NSDictionary<NSString *,NSInvocation *> *)eventStrategy
{
    if (!_eventStrategy) {
        _eventStrategy = @{
                           @"add:":[self createInvocationWithSelector:NSSelectorFromString(@"add:")],
                           @"textFieldValueChange":[self createInvocationWithSelector:NSSelectorFromString(@"textFieldValueChange:")]
                        };
    }return _eventStrategy;
}
#pragma mark - 事件处理
- (NSInvocation *)createInvocationWithSelector:(SEL)selector
{
    NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:[[self.delegate class] instanceMethodSignatureForSelector:selector]];
    invocation.target = self.delegate;
    invocation.selector = selector;
    return invocation;
}
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo withTarget:(UIViewController*)target
{
    if (!_delegate)_delegate = target;
    NSInvocation * invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}



@end
