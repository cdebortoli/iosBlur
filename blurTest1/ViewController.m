//
//  ViewController.m
//  blurTest1
//
//  Created by cdebortoli on 13/04/2014.
//  Copyright (c) 2014 sqli. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Screenshot.h"
#import "GPUImage.h"
#import "TCGCustomBlurView.h"
@interface ViewController ()

@end

@implementation ViewController
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.blurView setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blurViewToggle:(id)sender {
    if ([self.blurView isHidden])
    {
        UIImage *image = [self.view.superview convertViewToImage];
        [self.blurView updateBlurWithImage:image];
        [self.blurView setHidden:NO];
    }
    else{
        [self.blurView setHidden:YES];
    }
}

@end
