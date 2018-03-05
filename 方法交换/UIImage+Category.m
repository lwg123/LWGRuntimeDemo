//
//  UIImage+Category.m
//  LWGRunTime
//
//  Created by weiguang on 2017/1/5.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

@implementation UIImage (Category)

+ (void)load{
    //获取两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(xh_imageNamed:));
    
    //交换方法实现
    method_exchangeImplementations(m1, m2);
}

+ (UIImage *)xh_imageNamed:(NSString *)name{
    double verson = [[UIDevice currentDevice].systemVersion doubleValue];
    if (verson >= 10.2) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的图片
        name = [name stringByAppendingString:@"_os7"];
    }
    return [UIImage xh_imageNamed:name];
}

@end
