//
//  YOHTTPRequest.h
//  YOHTTPExample
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YOHTTPOperation.h"

@interface YOHTTPRequest : NSObject
@property (nonatomic,readonly) NSURLRequest *request;
@property (nonatomic, readonly) YOHTTPOperation *operation;
@property (nonatomic) NSOperationQueuePriority priority;

- (id)initWithRequest:(NSURLRequest *)request
             complete:(YOHTTPRequestSuccessBlock)successBlock
                error:(YOHTTPRequestErrorBlock)errorBlock;
- (void)start;
- (void)cancel;
@end
