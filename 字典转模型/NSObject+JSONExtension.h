//
//  NSObject+JSONExtension.h
//  LWGRunTime
//
//  Created by weiguang on 2017/1/9.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtension)

- (void)setDict:(NSDictionary *)dict;
+ (instancetype)objectWithDict:(NSDictionary *)dict;

//告诉数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass;

@end
