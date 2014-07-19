//
//  YOOperation.h
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^YOHTTPRequestSuccessBlock)(NSURLResponse *response, NSData *data);
typedef void (^YOHTTPRequestErrorBlock)(NSError *error);

@interface YOHTTPOperation : NSOperation<NSURLConnectionDataDelegate, NSURLConnectionDelegate>
@property (nonatomic, readonly) BOOL shouldUseCredential;
@property (nonatomic, readonly) NSURLConnection *connection;
- (id)initWithRequest:(NSURLRequest *)request success:(YOHTTPRequestSuccessBlock)success error:(YOHTTPRequestErrorBlock)error;
@end
