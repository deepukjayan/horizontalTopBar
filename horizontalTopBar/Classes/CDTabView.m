//
//  CDTabView.m
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import "CDTabView.h"
#import "CDTab.h"
#import "yourTabModel.h"

@interface CDTabView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation CDTabView

- (id)initWithTabArray:(NSMutableArray *)tabArray andFrame:(CGRect)frame
{
    self.tabArray = tabArray;
    return [self initWithFrame:frame];
}

- (void)reloadData
{
     [self initialize];
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
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, self.frame.size.width , 74)];
}

- (void)initialize
{
    NSArray *viewsToRemove = [self subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    self.scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollBg"]];
    
    int x = -60;
    
    for (yourTabModel *tab in self.tabArray) {
        
        CDTab *cdTab = [[CDTab alloc] initWithTitle:tab.title andImageUrl:tab.imageUrl andTabId:tab.tabId andStatus:tab.status andFrame:CGRectMake(x + 70, 0, 70, 70)];
        [self.scrollView addSubview:cdTab];
        
        x = x + 70;
    }
    
    [self.scrollView setContentSize:CGSizeMake([self.tabArray count] * 70 , 70)];
    
    [self addSubview:self.scrollView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
