//
//  YOHTTPRequest.m
//  YOHTTPExample
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import "YOHTTPRequest.h"
#import "YOHTTPOperationManager.h"

@interface YOHTTPRequest()
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) YOHTTPOperation *operation;
@end
@implementation YOHTTPRequest
@synthesize priority = _priority;

- (id)initWithRequest:(NSURLRequest *)request
{
    self = [super init];
    if (self) {
        self.request = request;
        _priority = NSOperationQueuePriorityNormal;
        return self;
    }
    
    return nil;
}

- (void)setPriority:(NSOperationQueuePriority)priority
{
    _priority = priority;
}

- (void)start:(YOHTTPRequestSuccessBlock)successBlock error:(YOHTTPRequestErrorBlock)errorBlock
{
    self.operation = [[YOHTTPOperation alloc] initWithRequest:self.request success:successBlock error:errorBlock];
    [self.operation setQueuePriority:self.priority];
    YOHTTPOperationManager *mgr = [YOHTTPOperationManager defaultManager];
    [mgr addOperation:self.operation];
}

- (void)cancel
{
    [self.operation cancel];
    self.operation = nil;
}
@end
