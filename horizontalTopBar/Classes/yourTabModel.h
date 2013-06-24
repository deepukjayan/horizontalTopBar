//
//  yourTabModel.h
//  horizontalTopBar
//
//  Created by Deepak K on 24/06/13.
//  Copyright (c) 2013 CodeWithDeepu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDTab.h"



@interface yourTabModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *tabId;
@property (nonatomic, assign) Status status;

@end
