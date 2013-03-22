//
//  TileView.h
//  Match Puzzle
//
//  Created by Gary Morris on 11/27/11.
//  Copyright (c) 2011 Gary A. Morris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIView

-(id)initWithFrontImage:(UIImage*)front BackImage:(UIImage*)back;

-(void)flipFrontToBack;

@end
