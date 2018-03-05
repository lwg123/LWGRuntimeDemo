//
//  Dog.m
//  LWGRunTime
//
//  Created by weiguang on 2017/1/9.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import "Dog.h"
#import "NSObject+Extension.h"

@interface Dog()<NSCoding>

@end

@implementation Dog

// 设置需要忽略的属性
- (NSArray *)ignoredNames {
    return @[@"_bone"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [self encode:aCoder];
}


@end
