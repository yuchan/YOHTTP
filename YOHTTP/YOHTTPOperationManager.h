//
//  YOHTTPOperationManager.h
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YOHTTPOperationManager : NSObject
+(id)defaultManager;
- (void)addOperation:(NSOperation *)operation;
@end
