//
//  CDTab.h
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CD_TAB_CLOSED @"CDTabClosed"

typedef enum {
    inActive,
    active
} Status ;

@interface CDTab : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *tabId;
@property (nonatomic, assign) Status status;

- (id)initWithTitle:(NSString *)title andImageUrl:(NSString *)imageUrl andTabId:(NSString *)tabId andStatus:(Status) status andFrame:(CGRect)frame;

@end
