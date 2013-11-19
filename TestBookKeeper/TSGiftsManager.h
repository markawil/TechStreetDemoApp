//
//  TSGiftManager.h
//  TestBookKeeper
//
//  Created by markw on 11/19/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSGift.h"

@interface TSGiftsManager : NSObject

- (void)addNewGift:(TSGift *)gift;
- (NSArray *)loadGifts;
- (void)removeGiftWithIndex:(NSInteger)index;

@end
