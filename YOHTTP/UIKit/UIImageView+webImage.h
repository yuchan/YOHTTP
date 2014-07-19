//
//  UIImageView+webImage.h
//  YOHTTPExample
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (webImage)
- (void)setImageWithUrl:(NSString *)url complete:(void(^)(UIImage *image, NSString *url))complete;
@end
