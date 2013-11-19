//
//  TSGiftManager.m
//  TestBookKeeper
//
//  Created by markw on 11/19/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "TSGiftsManager.h"
#import "TSGift.h"

#define GIFTS_FILE_PATH @"/tmp/gifts.dat"

@implementation TSGiftsManager

- (NSArray *)loadGifts {
    
    NSArray *giftsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:GIFTS_FILE_PATH];
    return giftsArray;
}

- (void)addNewGift:(TSGift *)gift {
    
    NSMutableArray *giftsArray = [NSMutableArray arrayWithArray:[self loadGifts]];
    [giftsArray addObject:gift];
    [NSKeyedArchiver archiveRootObject:giftsArray toFile:GIFTS_FILE_PATH];
}

- (void)removeGiftWithIndex:(NSInteger)index {
    
    NSMutableArray *giftsArray = [NSMutableArray arrayWithArray:[self loadGifts]];
    [giftsArray removeObjectAtIndex:index];
    [NSKeyedArchiver archiveRootObject:giftsArray toFile:GIFTS_FILE_PATH];
}

@end
