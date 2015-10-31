//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Ben on 10/25/15.
//  Copyright © 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger) calculateTotalPriceInCents {
    NSUInteger sumOfPrices = 0;
    for (FISItem *item in self.items) {
        sumOfPrices += item.priceInCents;
    }
    return sumOfPrices;
}

- (void) addItem:(FISItem *)item {
    [self.items addObject:item];
}

- (void) removeItem:(FISItem *)item {
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
}

- (void) removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObjectIdenticalTo:item];
}

- (void) sortItemsByNameAsc {
    NSSortDescriptor *sortByAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByAsc]]mutableCopy];
}

- (void) sortItemsByNameDesc {
    NSSortDescriptor *sortByDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByDesc]]mutableCopy];
}

- (void) sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByPriceAsc]]mutableCopy];
}

- (void) sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByPriceDesc]]mutableCopy];
}

- (NSArray *)allItemsWithName:(NSString *)name {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    NSArray *itemsWithName = [self.items filteredArrayUsingPredicate:namePredicate];
    return itemsWithName;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)integerArgument {
    NSPredicate *equalToGreaterPredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", integerArgument];
    NSArray *itemsGreaterThanOrEqualTo = [self.items filteredArrayUsingPredicate:equalToGreaterPredicate];
    return itemsGreaterThanOrEqualTo;
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)integerArgument {
    NSPredicate *equalToLessPredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", integerArgument];
    NSArray *itemsLessThanOrEqualTo = [self.items filteredArrayUsingPredicate:equalToLessPredicate];
    return itemsLessThanOrEqualTo;
}

@end

