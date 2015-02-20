//
//  YOOperation.m
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import "YOHTTPOperation.h"
@interface YOHTTPOperation()
{
    BOOL executing;
    BOOL finished;
}
@property (nonatomic) BOOL shouldUseCredential;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURLResponse *response;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, copy) YOHTTPRequestSuccessBlock successBlock;
@property (nonatomic, copy) YOHTTPRequestErrorBlock errorBlock;
@end

@implementation YOHTTPOperation
- (id)init
{
    self = [super init];
    if (self) {
        executing = NO;
        finished = NO;
        self.data = [[NSMutableData alloc] init];
        return self;
    }
    
    return nil;
}

- (id)initWithRequest:(NSURLRequest *)request success:(YOHTTPRequestSuccessBlock)success error:(YOHTTPRequestErrorBlock)error
{
    self = [self init];
    if (self) {
        self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        self.successBlock = success;
        self.errorBlock = error;
        self.shouldUseCredential = YES;
    }
    
    return self;
}

- (BOOL) isConcurrent
{
    return YES;
}

- (BOOL) isExecuting
{
    return executing;
}

- (BOOL) isFinished
{
    return finished;
}

- (void)setFinished:(BOOL)_finished
{
    [self willChangeValueForKey:@"isFinished"];
    finished = _finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)_executing
{
    [self willChangeValueForKey:@"isExecuting"];
    executing = _executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void) start
{
    @synchronized(self){
    if ([self isCancelled]) {
        [self setFinished:YES];
        return;
    }
    
    [self setExecuting:YES];
    [self.connection scheduleInRunLoop:[NSRunLoop mainRunLoop]
                               forMode:NSDefaultRunLoopMode];
    [self.connection start];
    }
}

- (void)main
{
    @try {
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)cancel
{
    [super cancel];
    [self.connection cancel];
    [self completeOperation];
}

- (void)completeOperation
{   [self setExecuting:NO];
    [self setFinished:YES];
}

#pragma mark - NSURLConnection
- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@", response.URL.absoluteString);
    self.response = response;
}

- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection
{
    return self.shouldUseCredential;
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    if (!self.data) {
        self.data = [[NSMutableData alloc] init];
    }
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    if (self.successBlock) {
        self.successBlock(self.response, self.data);
    }
    
    [self completeOperation];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    if (self.errorBlock) {
        self.errorBlock(error);
    }
    [self completeOperation];
}

@end
