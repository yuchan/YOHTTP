//
//  UIImageView+YOHTTP.m
//
//  Created by Ohashi Yusuke on 7/19/14.
//  Copyright (c) 2014 Ohashi Yusuke. All rights reserved.
//

#import "UIImageView+YOHTTP.h"
#import "YOHTTPRequest.h"

@implementation UIImageView (YOHTTP)
- (void)setImageWithUrl:(NSString *)url complete:(void(^)(UIImage *image, NSString *url))complete
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    YOHTTPRequest *req = [[YOHTTPRequest alloc] initWithRequest:request];
    
    [req start:^(NSURLResponse *res, NSData *data){
            UIImage *image = [UIImage imageWithData:data scale:[UIScreen mainScreen].scale];
        if (image) {
            self.image = image;
            [self setNeedsDisplay];        
        }
    } error:^(NSError *error){
        
    }];
}
@end
