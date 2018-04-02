//
//  ZGEventProxy.h
//  ResponderChain
//
//  Created by Magic on 2018/4/2.
//  Copyright © 2018年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGEventProxy : NSProxy

+ (__kindof ZGEventProxy *)sharedEventProxy;
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo withTarget:(UIViewController*)target;

@end
