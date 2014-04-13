//
//  UIView+Screenshot.m
//  blurTest1
//
//  Created by cdebortoli on 13/04/2014.
//  Copyright (c) 2014 sqli. All rights reserved.
//

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

-(UIImage *)convertViewToImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
