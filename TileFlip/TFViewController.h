//
//  TFViewController.h
//  TileFlip
//
//  Created by Gary Morris on 11/27/11.
//  Copyright (c) 2011 Gary A. Morris. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileView;

@interface TFViewController : UIViewController
{
    TileView* tileView;
}

@property (nonatomic, retain) TileView* tileView;

@end
