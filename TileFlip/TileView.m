//
//  TileView.m
//  Match Puzzle
//
//  Created by Gary Morris on 11/27/11.
//  Copyright (c) 2011 Gary A. Morris. All rights reserved.
//

#import "TileView.h"
#import <QuartzCore/QuartzCore.h>

#define kFlipDuration (8)   /* seconds */

@interface TileView()

@property (nonatomic, strong) UIImage* frontImage;
@property (nonatomic, strong) UIImage* backImage;

@end


@implementation TileView

-(void)dealloc 
{
    [_frontImage release];
    [_backImage  release];
    [super dealloc];
}

-(id)initWithFrontImage:(UIImage*)front BackImage:(UIImage*)back
{
    CGRect aFrame = CGRectMake(0,0, front.size.width, front.size.height);
    
    if ((self = [super initWithFrame:aFrame])) {
        _frontImage = [front retain];
        _backImage  = [back  retain];

        // init the layer contents with the front image
        self.layer.contents = (id) _frontImage.CGImage;
    }
    
    return self;
}

-(void)flipFrontToBack
{    
    CATransform3D flipTrans1 = CATransform3DMakeRotation(M_PI/2, 0, 1, 0);
    flipTrans1.m14 = -0.001f;     // add 3D perspective

    CATransform3D flipTrans2 = CATransform3DMakeRotation(M_PI/2, 0, 1, 0);
    flipTrans2.m14 = +0.001f;     // add 3D perspective

    //--------------------------------------------------
    // Transform (rotate) around the Y axis
    //--------------------------------------------------
    CAKeyframeAnimation* flipAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    flipAnim.values   = [NSArray arrayWithObjects:
                         [NSValue valueWithCATransform3D:CATransform3DIdentity], 
                         [NSValue valueWithCATransform3D:flipTrans1],
                         [NSValue valueWithCATransform3D:flipTrans2],
                         [NSValue valueWithCATransform3D:CATransform3DIdentity], 
                         nil];
    flipAnim.keyTimes = [NSArray arrayWithObjects:
                         [NSNumber numberWithFloat:0.0f],
                         [NSNumber numberWithFloat:0.49f],
                         [NSNumber numberWithFloat:0.50f],
                         [NSNumber numberWithFloat:1.0f],                         
                         nil];
    flipAnim.duration = kFlipDuration;
    
    //---------------------------------------------------
    // Switch contents (images) halfway thru the animation
    //---------------------------------------------------
    CAKeyframeAnimation* contentAnim = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    contentAnim.values   = [NSArray arrayWithObjects:
                            (id)_frontImage.CGImage,
                            (id)_backImage.CGImage, nil];
    contentAnim.keyTimes = [NSArray arrayWithObjects: 
                            [NSNumber numberWithFloat:0.49f],
                            [NSNumber numberWithFloat:0.50f], nil];  
    contentAnim.duration = flipAnim.duration;
    
    
    //---------------------------------------------------
    // Group the transform and contents so that they
    // run at the same time
    //---------------------------------------------------
    CAAnimationGroup* animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:contentAnim, flipAnim, nil];    
    animGroup.duration   = flipAnim.duration;
    animGroup.removedOnCompletion = NO;
    
    // repeat and autoreverse for testing only:
    animGroup.repeatCount  = HUGE_VALF;
    animGroup.autoreverses = YES;           
	
    [self.layer addAnimation:animGroup forKey:@"flip"];
}

@end
