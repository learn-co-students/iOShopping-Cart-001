//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Richard Martin on 2015-11-22.
//  Copyright © 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *items;

- (NSUInteger)calculateTotalPriceInCents;

- (void)addItem:(FISItem *)item;

- (void)removeItem:(FISItem *)item;

- (void)removeAllItemsLikeItem:(FISItem *)item;

- (void)sortItemsByNameAsc;

- (void)sortItemsByNameDesc;

- (void)sortItemsByPriceInCentsAsc;

- (void)sortItemsByPriceInCentsDesc;

- (NSArray *)allItemsWithName:(NSString *)name;

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)priceInCents;

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)priceInCents;

@end
