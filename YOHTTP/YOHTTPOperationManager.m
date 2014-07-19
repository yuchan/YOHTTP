//
//  YOHTTPOperationManager.m
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import "YOHTTPOperationManager.h"
@interface YOHTTPOperationManager()
{
    
}
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation YOHTTPOperationManager
+ (id)defaultManager
{
    static id staticInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticInstance = [[self alloc] init];
    });
    return staticInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.queue = [NSOperationQueue new];
        return self;
    }
    
    return nil;
}

- (void)addOperation:(NSOperation *)operation
{
    [self.queue addOperation:operation];
}

@end
