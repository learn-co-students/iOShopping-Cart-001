//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Alex J Lee on 10/17/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject
@property (strong, nonatomic) NSMutableArray *items;

// No arguments
- (NSUInteger )calculateTotalPriceInCents;

- (void)addItem: (FISItem *)item;
- (void)removeItem: (FISItem *)item;
- (void)removeAllItemsLikeItem: (FISItem *)item;
- (void)sortItemsByNameAsc;
- (void)sortItemsByNameDesc;
- (void)sortItemsByPriceInCentsAsc;
- (void)sortItemsByPriceInCentsDesc;

- (NSArray *)allItemsWithName:(NSString *)name;
- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger )number;
- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger )number;


@end
