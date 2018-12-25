//
//  main.m
//  test_iOS
//
//  Created by yongle on 2018/12/25.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <objc/runtime.h>
#import <objc/message.h>

@interface Person : NSObject
{
@public
    int _age;
}
@property (nonatomic, assign) int height;

- (void)personMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {}
+ (void)personClassMethod {}
@end

/* Student */
@interface Student : Person
{
@public
    int _no;
}
@property (nonatomic, assign) int score;
- (void)studentMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)studentMethod {}
+ (void)studentClassMethod {}
@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSObject *object = [[NSObject alloc] init];
        Person *person = [[Person alloc] init];
        Student *student = [[Student alloc] init];
        
        //[object debugDescription];
        [person debugDescription];
        [student debugDescription];
        
        Class newClass = objc_allocateClassPair(objc_getClass("NSObject"), "newClass", 0);
        objc_registerClassPair(newClass);
        id newObject = [[newClass alloc] init];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
