//
//  ViewController.m
//  LWGRunTime
//
//  Created by weiguang on 2017/1/5.
//  Copyright © 2017年 weiguang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Dog.h"
#import "NSObject+Category.h"
#import "User.h"
#import "Book.h"
#import "NSObject+JSONExtension.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self archiver];
   // [self json];
    [self exchangImage];
}

/// 字典转模型demo
- (void)json{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    User *user = [User objectWithDict:json];
    Book *book = user.books[0];
    Cat *cat = user.cat;
    Fish *fish = cat.fish;
    
    NSLog(@"%@  %@  %@",book.name,cat.name,fish.name);
}

/// 解归档demo
- (void)archiver {
    //对person进行解归档
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"abc.plist"];
    Person *person = [[Person alloc] init];
    //归档
    person.name = @"人民";
    person.age = @"18";
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    Person *person1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@  %@",person1.name,person1.age);
    
    //对Dog解归档
    NSString *path1 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Dog.plist"];
    Dog *dog = [[Dog alloc] init];
    dog.bone = @"骨头";
    dog.leg = @"狗腿子";
    
    [NSKeyedArchiver archiveRootObject:dog toFile:path1];
    
    Dog *dog1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
    
    NSLog(@"%@  %@",dog1.bone,dog1.leg);
    NSLog(@"%@",path1);
}

//交换方法例子
- (void) exchangImage {
    //交换方法获取不同系统版本下的图片
    _myimage.image = [UIImage imageNamed:@"1"];
}



@end
