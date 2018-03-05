//
//  Person.m
//  LWGRunTime
//
//  Created by weiguang on 2017/1/9.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person()<NSCoding>

@end

@implementation Person

//设置不需要归解档的属性
- (NSArray *)ignoredNames {
    return @[@"_age",@"_bbb",@"_ccc"];
}

//解档方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //获取所有成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            //将每个成员变量名转换为NSString对象类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //忽略不需要解档的属性
            if ([[self ignoredNames] containsObject:key]) {
                continue;
            }
            //根据变量名解档取值，无论是什么类型
            id value = [aDecoder decodeObjectForKey:key];
            //取出的值在设置给属性
            [self setValue:value forKey:key];
            // 这两步就相当于以前的 self.age = [aDecoder decodeObjectForKey:@"_age"];
        }
        free(ivars);
    }
    return self;
}

//归档调用方法
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //获取所有成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        if ([[self ignoredNames] containsObject:key]) {
            continue;
        }
        
        //通过成员变量名，取出成员变量的值
        id value = [self valueForKey:key];
        //再将值归档
        [aCoder encodeObject:value forKey:key];
    }
    
}




@end
