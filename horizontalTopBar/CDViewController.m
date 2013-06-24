//
//  CDViewController.m
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import "CDViewController.h"
#import "CDScrollTab.h"

@interface CDViewController ()

@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) CDTabView *tabView;

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self observeNotifications];
    
    self.arr = [[NSMutableArray alloc]init];
    
    yourTabModel *tab1 = [[yourTabModel alloc]init];
    tab1.title = @"Ram";
    tab1.imageUrl = @"http://graph.facebook.com/4564646/picture?type=small";
    tab1.tabId = @"232342";
    tab1.status = active;
    
    [self.arr addObject:tab1];
    
    yourTabModel *tab2 = [[yourTabModel alloc]init];
    tab2.title = @"Gopal";
    tab2.imageUrl = @"https://si0.twimg.com/profile_images/3576648165/1601a48498865063b09c5aa0ea728ccb_bigger.png";
    tab2.tabId = @"232343";
    tab2.status = inActive;
    
    [self.arr addObject:tab2];
    
    self.tabView = [[CDTabView alloc] initWithTabArray:self.arr andFrame:CGRectMake(0, 44, self.view.frame.size.width, 70)];
    [self.view addSubview:self.tabView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)observeNotifications
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cdTabClosed:)
			   name:CD_TAB_CLOSED object:nil];
}

- (IBAction)addNew:(id)sender {
    
    yourTabModel *newTab = [[yourTabModel alloc]init];
    newTab.title = @"Varma";
    newTab.imageUrl = @"http://graph.facebook.com/234234234/picture?type=small";
    newTab.tabId = @"232344";
    newTab.status = active;
    
    [self.arr addObject:newTab];
    [self.tabView reloadData];
}

- (void)cdTabClosed:(NSNotification *)note
{
    UIButton *sender = note.object;
    
    for (yourTabModel *tab in self.arr) {
        
        if ([tab.tabId isEqualToString:[NSString stringWithFormat:@"%ld",(long)sender.tag]]) {
            [self.arr removeObject:tab];
            break;
        }
    }
    [self.tabView reloadData];
}

@end
