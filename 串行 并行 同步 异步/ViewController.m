//
//  ViewController.m
//  串行 并行 同步 异步
//
//  Created by 利民网 on 2017/7/12.
//  Copyright © 2017年 利民网. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 串行 + 同步
- (IBAction)serialSyncClick:(id)sender {
    NSLog(@"start log in main thread");
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", NULL);
    for (NSInteger n = 0; n < 3; n++) {
        dispatch_sync(myQueue, ^{
            for (NSInteger i = 0; i < 500000000; i++) {
                if (i == 0) {
                    NSLog(@"串行同步任务%ld -> 开始%@",n,[NSThread currentThread]);
                }
                if (i == 499999999) {
                    NSLog(@"串行同步任务%ld -> 完成",(long)n);
                }
            }
        });
    }
    NSLog(@"阻塞我没有？当前线程%@",[NSThread currentThread]);
}

// 串行 + 异步
- (IBAction)serialAsyncClick:(id)sender {
    NSLog(@"start log in main thread");
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", NULL);//创建一个串行队列
    for (NSInteger n = 0; n < 3; n++) {
        dispatch_async(myQueue, ^{
            for (NSInteger i = 0; i < 500000000; i++) {
                if (i == 0) {
                    NSLog(@"串行异步任务%ld -> 开始%@",n,[NSThread currentThread]);
                }
                if (i == 499999999) {
                    NSLog(@"串行异步任务%ld -> 完成",(long)n);
                }
            }
        });
    }
    NSLog(@"阻塞我没有？当前线程%@",[NSThread currentThread]);
}

// 并行 + 同步
- (IBAction)concurrentSyncClick:(id)sender {
    NSLog(@"start log in main thread");
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger n = 0; n < 3; n++) {
        dispatch_sync(myQueue, ^{
            for (NSInteger i = 0; i < 500000000; i++) {
                if (i == 0) {
                    NSLog(@"并行同步任务%ld -> 开始%@",(long)n,[NSThread currentThread]);
                }
                if (i == 499999999) {
                    NSLog(@"并行同步任务%ld -> 完成",(long)n);
                }
            }
        });
    }
    
    NSLog(@"阻塞我没有？当前线程%@",[NSThread currentThread]);
}

// 并行 + 异步
- (IBAction)concurrentAsyncClick:(id)sender {
    NSLog(@"start log in main thread");
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger n = 0; n < 3; n++) {
        dispatch_async(myQueue, ^{
            for (NSInteger i = 0; i < 500000000; i++) {
                if (i == 0) {
                    NSLog(@"并行异步任务%ld -> 开始%@",n,[NSThread currentThread]);
                }
                if (i == 499999999) {
                    NSLog(@"并行异步任务%ld -> 完成",(long)n);
                }
            }
        });
    }
    NSLog(@"阻塞我没有？当前线程%@",[NSThread currentThread]);
}

@end
