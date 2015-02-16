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
@end
@implementation YOHTTPRequest

- (id)initWithRequest:(NSURLRequest *)request
             complete:(YOHTTPRequestSuccessBlock)successBlock
                error:(YOHTTPRequestErrorBlock)errorBlock
{
    self = [super init];
    if (self) {
        _request = request;
        _priority = NSOperationQueuePriorityNormal;
        _operation = [[YOHTTPOperation alloc] initWithRequest:request success:successBlock error:errorBlock];
        return self;
    }
    
    return nil;
}

- (void)start
{
    [self.operation setQueuePriority:self.priority];
    YOHTTPOperationManager *mgr = [YOHTTPOperationManager defaultManager];
    [mgr addOperation:self.operation];
}

- (void)cancel
{
    [self.operation cancel];
}
@end
