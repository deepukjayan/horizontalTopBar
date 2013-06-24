//
//  CDTab.m
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import "CDTab.h"
#import "AFNetworking.h"

@interface CDTab ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIImageView *statusIndicator;

@end


@implementation CDTab

- (id)initWithTitle:(NSString *)title andImageUrl:(NSString *)imageUrl andTabId:(NSString *)tabId andStatus:(Status) status andFrame:(CGRect)frame
{
    self.title = title;
    self.imageUrl = imageUrl;
    self.tabId = tabId;
    self.status = status;
    
    return [self initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, 70 , 70)];
}

- (void)initialize
{
    //ImageView
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    [self.imageView setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:[UIImage imageNamed:@"user"]];
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tabSelected:)];
    [self.imageView addGestureRecognizer:tap];
    
    [self addSubview:self.imageView];
    
    //Title label
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 57, 50, 15)];
    self.titleLabel.text = self.title;
    self.titleLabel.tag = [self.tabId integerValue];
    [self addSubview:self.titleLabel];
    
    //Status Indicator
    self.statusIndicator = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 15, 15)];
    [self.statusIndicator setImage:[UIImage imageNamed:((self.status == active) ? @"active" : @"inActive")]];
    [self addSubview:self.statusIndicator];
    
    //Close Button
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 2, 30, 30)];
    [self.closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    self.closeButton.tag = [self.tabId integerValue];
    [self.closeButton addTarget:self action:@selector(tabClosed:) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton.userInteractionEnabled = YES;
    [self addSubview:self.closeButton];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)tabClosed:(id)sender
{
    UIButton *closeButton = (UIButton *)sender;
    [[NSNotificationCenter defaultCenter] postNotificationName:CD_TAB_CLOSED object:closeButton];
}


- (void)tabSelected: (id)sender
{
    
}
@end
