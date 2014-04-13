//
//  TCGCustomBlurView.h
//  blurTest1
//
//  Created by cdebortoli on 13/04/2014.
//  Copyright (c) 2014 sqli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPUImageiOSBlurFilter, GPUImageView;
@interface TCGCustomBlurView : UIView

@property (strong, nonatomic) IBOutlet GPUImageView *imageBlurView;
@property (strong, nonatomic) GPUImageiOSBlurFilter *blurFilter;

-(void)updateBlurWithImage:(UIImage *)image;

@end
