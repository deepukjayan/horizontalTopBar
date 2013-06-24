//
//  CDTabView.h
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDTabView : UIView

@property (nonatomic, strong) NSMutableArray *tabArray;

- (id)initWithTabArray:(NSMutableArray *)tabArray andFrame:(CGRect)frame;
- (void)reloadData;

@end
