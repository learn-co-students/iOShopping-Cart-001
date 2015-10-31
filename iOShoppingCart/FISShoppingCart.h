//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by Ben on 10/25/15.
//  Copyright © 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h" 

@interface FISShoppingCart : NSObject

@property (strong, atomic) NSMutableArray *items;

- (NSUInteger) calculateTotalPriceInCents;

- (void) addItem: (FISItem *)item;

- (void) removeItem:(FISItem *)item;

- (void) removeAllItemsLikeItem: (FISItem *)item;

- (void) sortItemsByNameAsc;

- (void) sortItemsByNameDesc;

- (void) sortItemsByPriceInCentsAsc;

- (void) sortItemsByPriceInCentsDesc;

- (NSArray *) allItemsWithName: (NSString *) name;

- (NSArray *) allItemsWithMinimumPriceInCents: (NSUInteger) integerArgument;

- (NSArray *) allItemsWithMaximumPriceInCents: (NSUInteger) integerArgument;


@end
