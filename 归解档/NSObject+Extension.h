//
//  NSObject+Extension.h
//  LWGRunTime
//
//  Created by weiguang on 2017/1/9.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSArray *)ignoredNames;
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
