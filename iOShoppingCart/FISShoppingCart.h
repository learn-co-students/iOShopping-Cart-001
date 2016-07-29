//
//  FISShoppingCart.h
//  iOShoppingCart
//
//  Created by JASON HARRIS on 9/23/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *items;

- (NSUInteger)calculateTotalPriceInCents;
- (void)addItem: (FISItem *)item;
- (void)removeItem: (FISItem *)item;
- (void)removeAllItemsLikeItem: (FISItem *)item;
- (void)sortItemsByNameAsc;
- (void)sortItemsByNameDesc;
- (void)sortItemsByPriceInCentsAsc;
- (void)sortItemsByPriceInCentsDesc;
- (NSArray *)allItemsWithName: (NSString *)name;
- (NSArray *)allItemsWithMinimumPriceInCents: (NSUInteger)arguement;
- (NSArray *)allItemsWithMaximumPriceInCents: (NSUInteger)arguement;


@end

/* I. Create a new FISShoppingCart class the inherits from NSObject.
 Import FISItem into FISShoppingCart's header file.
 Declare one property, an NSMutableArray called items.
 Declare the following 11 methods in FISShoppingCart.h:
 
 calculateTotalPriceInCents which takes no arguments and returns an NSUInteger,
 addItem: which takes one FISItem argument called item and provides no return,
 removeItem: which takes one FISItem argument called item and provides no return,
 removeAllItemsLikeItem: which takes on FISItem argument called item and provides no return,
 sortItemsByNameAsc which takes no arguments and provides no return,
 sortItemsByNameDesc which takes no arguments and provides no return,
 sortItemsByPriceInCentsAsc which takes no arguments and provides no return,
 sortItemsByPriceInCentsDesc which takes no arguments and provides no return,
 allItemsWithName: which takes one NSString argument called name and returns an NSArray,
 allItemsWithMinimumPriceInCents: which takes one NSUInteger argument and returns an NSArray, and
 allItemsWithMaximumPriceInCents: which takes one NSUInteger argument and returns an NSArray.
 */