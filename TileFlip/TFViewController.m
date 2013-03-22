//
//  MPViewController.m
//  Match Puzzle
//
//  Created by Gary Morris on 11/26/11.
//  Copyright (c) 2011 Gary A. Morris. All rights reserved.
//

#import "TFViewController.h"
#import "TileView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TFViewController

@synthesize tileView;

-(void)dealloc
{
    [tileView release];
    [super dealloc];
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage* backImage = [UIImage imageNamed:@"square_rainbow320back"];
    UIImage* frontImage= [UIImage imageNamed:@"square_rainbow320"];
    
    self.tileView = [[TileView alloc] initWithFrontImage:frontImage 
                                               BackImage:backImage];
    tileView.center = [self.view convertPoint:self.view.center toView:tileView];
    
    [self.view addSubview:tileView];

    [tileView flipFrontToBack];
}

@end
