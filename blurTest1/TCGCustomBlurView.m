//
//  TCGCustomBlurView.m
//  blurTest1
//
//  Created by cdebortoli on 13/04/2014.
//  Copyright (c) 2014 sqli. All rights reserved.
//

#import "TCGCustomBlurView.h"
#import "GPUImage.h"

@implementation TCGCustomBlurView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib{
    self.imageBlurView = [[GPUImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.imageBlurView];
}


#pragma mark - blur

-(void)updateBlurWithImage:(UIImage *)image
{
    UIImage *croppedImage = [self imageByCropping:image toRect:self.frame];
    if(self.blurFilter == nil){
        self.blurFilter = [[GPUImageiOSBlurFilter alloc] init];
        self.blurFilter.blurRadiusInPixels = 1.0f;
    }
    
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:croppedImage];
    [picture addTarget:self.blurFilter];
    [self.blurFilter addTarget:self.imageBlurView];
    [picture processImage];
    
    [picture processImageWithCompletionHandler:^{
        [self.blurFilter removeAllTargets];
    }];
    
    //    self.imageBlurView.layer.contentsRect = CGRectMake(0.0f, 0.0f, 1.0f, 0.0f);
    //    [UIView animateWithDuration:5.0f animations:^(void){
    //        self.imageBlurView.layer.contentsRect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //    }];
    
}

- (UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
}
@end
