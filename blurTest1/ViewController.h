//
//  ViewController.h
//  blurTest1
//
//  Created by cdebortoli on 13/04/2014.
//  Copyright (c) 2014 sqli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPUImageView,TCGCustomBlurView;
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet TCGCustomBlurView *blurView;
- (IBAction)blurViewToggle:(id)sender;
@end
