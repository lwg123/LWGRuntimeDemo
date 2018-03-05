//
//  Cat.h
//  LWGRunTime
//
//  Created by weiguang on 2017/1/9.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fish.h"

@interface Cat : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign) double price;
//属性是一个对象
@property (nonatomic,strong) Fish *fish;

@end
